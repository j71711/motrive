import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/services/local_keys_service.dart';
import 'package:motrive/features/expenses/data/models/expenses_model.dart';
import 'package:motrive/features/expenses/domain/entities/add_expense_entity.dart';
import 'package:motrive/features/expenses/domain/entities/expense_stats_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseExpensesRemoteDataSource {
  // Future<ExpensesModel> getExpenses();
  Future<List<ExpensesModel>> getExpenses(String vehicleId);
  Future<ExpenseStatsEntity> getExpenseStats(String vehicleId);
}

@LazySingleton(as: BaseExpensesRemoteDataSource)
class ExpensesRemoteDataSource implements BaseExpensesRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  ExpensesRemoteDataSource(this._localKeysService, this._supabase);

Future<void> updateExpense(
  String id,
  AddExpenseModel model
  // Map<String, dynamic> data,
) async {
   try {
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


Future<void> deleteExpense(
  String expenseId,
) async {
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
  Future<List<ExpensesModel>> getExpenses(String vehicleId) async {
    // try {
    //   return ExpensesModel(id: 1, firstName: "Last Name", lastName: "First Name");
    // } catch (error) {
    //  throw FailureExceptions.getException(error);
    // }
    try {
      print('❤️');
      final response = await _supabase
          .from('expense_records')
          .select()
          .eq('vehicle_id', vehicleId) // vehicleId
          .order('expense_date', ascending: false);
      return response
          .map<ExpensesModel>((e) => ExpensesModel.fromJson(e))
          .toList();
    } catch (error) {
      print('❌');
      print(error);
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

  @override
  Future<ExpenseStatsEntity> getExpenseStats(String vehicleId) async {
    print('❤️');
    final response = await _supabase
        .from('expense_records')
        .select()
        .eq('vehicle_id', 'd4c4ffb3-7d73-415c-be14-b98e1907f9ef');

    double monthly = 0;
    double yearly = 0;
    double fuel = 0;
    double maintenance = 0;

    final now = DateTime.now();

    for (final item in response) {
      // final amount = (item['amount'] as num).toDouble();
      final amount = (item['cost'] as num?)?.toDouble() ?? 0.0;

      final date = DateTime.parse(item['expense_date']);

      if (date.month == now.month) {
        monthly += amount;
      }
      if (date.year == now.year) {
        yearly += amount;
      }

      if (item['category'] == 'service') {
        fuel += amount;
      }

      if (item['category'] == 'maintenance') {
        maintenance += amount;
      }
      print('👀');
      print('$response  👀');

    }
    return ExpenseStatsEntity(
      monthlyTotal: monthly,
      yearlyTotal: yearly,
      fuelTotal: fuel,
      maintenanceTotal: maintenance,
    );
  }
}
