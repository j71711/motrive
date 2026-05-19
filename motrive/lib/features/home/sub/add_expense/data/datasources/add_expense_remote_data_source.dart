import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/core/services/local_keys_service.dart';
import 'package:motrive/features/home/sub/add_expense/data/models/add_expense_model.dart';
import 'package:motrive/core/errors/network_exceptions.dart';

abstract class BaseAddExpenseRemoteDataSource {
  Future<void> addExpense(AddExpenseModel model);
  Future<void> updateExpense(AddExpenseModel model);
  Future<void> deleteExpense(String expenseId);
  Future<AddExpenseModel> getExpenseDetails(String expenseId);
}

@LazySingleton(as: BaseAddExpenseRemoteDataSource)
class AddExpenseRemoteDataSource implements BaseAddExpenseRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  AddExpenseRemoteDataSource(this._localKeysService, this._supabase);


 @override
  Future<void> addExpense(AddExpenseModel model) async {
    try {
      await _supabase.from('expense_records').insert({
        'vehicle_id': model.vehicleId,
        'category': model.category,
        'cost': model.cost,
        'odometer_at_expense': model.odometer,
        'notes': model.notes,
        'expense_date': DateTime.now().toIso8601String(),
      });
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> updateExpense(AddExpenseModel model) async {
    try {
      await _supabase
          .from('expense_records')
          .update({
            'category': model.category,
            'cost': model.cost,
            'odometer_at_expense': model.odometer,
            'notes': model.notes,
          })
          .eq('id', model.id.toString())
          ;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }


  @override
  Future<void> deleteExpense(String expenseId) async {
    try {
      await _supabase
          .from('expense_records')
          .delete()
          .eq('id', expenseId);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }


 @override
  Future<AddExpenseModel> getExpenseDetails(
    String expenseId,
  ) async {
    try {
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
