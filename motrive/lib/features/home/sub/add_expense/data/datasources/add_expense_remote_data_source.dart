import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/maintenance/data/models/vehicle/vehicle_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/features/home/sub/add_expense/data/models/add_expense_model.dart';
import 'package:motrive/core/errors/network_exceptions.dart';

abstract class BaseAddExpenseRemoteDataSource {
  Future<void> addExpense(AddExpenseModel model);
  UserVehicleModel getUserVehicle();
  Future<void> updateExpense(AddExpenseModel model);
  Future<void> deleteExpense(String expenseId);
  Future<AddExpenseModel> getExpenseDetails(String expenseId);
}

@LazySingleton(as: BaseAddExpenseRemoteDataSource)
class AddExpenseRemoteDataSource implements BaseAddExpenseRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  AddExpenseRemoteDataSource(this._userService, this._supabase);

  @override
  Future<void> addExpense(AddExpenseModel model) async {
    if (_userService.currentVehicle == null) {
      throw Exception('No car registered');
    }
    await _supabase.from('expense_records').insert({
      'user_id': _userService.currentUser!.id,
      'vehicle_id': _userService.currentVehicle!.id,
      'category': model.category,
      'cost': model.cost,
      'odometer_at_expense': model.odometer,
      'notes': model.notes,
      'expense_date': DateTime.now().toIso8601String(),
    });
    final updatedCar = await _supabase
        .from('vehicles')
        .update({'current_odometer': model.odometer})
        .eq('user_id', _userService.currentUser!.id)
        .select();

    _userService.setVehicle = UserVehicleModel.fromJson(updatedCar.first);
  }

  @override
  Future<void> updateExpense(AddExpenseModel model) async {
    try {
      if (_userService.currentVehicle == null) {
        throw Exception('No car registered');
      }
      await _supabase
          .from('expense_records')
          .update({
            'category': model.category,
            'cost': model.cost,
            'odometer_at_expense': model.odometer,
            'notes': model.notes,
          })
          .eq('id', model.id.toString());
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> deleteExpense(String expenseId) async {
    try {
      if (_userService.currentVehicle == null) {
        throw Exception('No car registered');
      }
      await _supabase.from('expense_records').delete().eq('id', expenseId);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<AddExpenseModel> getExpenseDetails(String expenseId) async {
    try {
      if (_userService.currentVehicle == null) {
        throw Exception('No car registered');
      }
      final response = await _supabase
          .from('expense_records')
          .select()
          .eq('id', expenseId)
          .single();

      return AddExpenseModel.fromJson(response);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  UserVehicleModel getUserVehicle() {
    return _userService.currentVehicle!;
  }

  //   @override
  //   Future<void> addExpense(AddExpenseModel model) async {
  //     try {
  //       final user = _supabase.auth.currentUser;
  // if (user == null) {
  //   throw Exception('User not authenticated');
  // }
  // else{
  //   final userId = _supabase.auth.currentUser!.id;
  //      await _supabase.from('expense_records').insert({
  //         ...model.toJson(),
  //         'vehicle_id': model.vehicleId,
  //         'user_id': userId,
  //       });
  // }

  //     } catch (error) {
  //       throw FailureExceptions.getException(error);
  //     }
  //   }
}
