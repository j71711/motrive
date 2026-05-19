import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/services/local_keys_service.dart';
import 'package:motrive/features/expenses/data/models/expenses_model.dart';
import 'package:motrive/features/expenses/domain/entities/add_expense_entity.dart';
import 'package:motrive/features/expenses/domain/entities/expense_stats_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseExpensesRemoteDataSource {
  Future<void> addExpense(AddExpenseModel model);
  Future<void> updateExpense(AddExpenseModel model);
  Future<void> deleteExpense(String expenseId);
  Future<AddExpenseModel> getExpenseDetails(String expenseId);
  Future<List<ExpensesModel>> getExpenses(String vehicleId);
  Future<ExpenseStatsEntity> getExpenseStats(String vehicleId);
}

@LazySingleton(as: BaseExpensesRemoteDataSource)
class ExpensesRemoteDataSource implements BaseExpensesRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  ExpensesRemoteDataSource(this._localKeysService, this._supabase);

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
          .eq('id', model.id.toString());
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

@override
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
    try {
      print('❤️');
      final response = await _supabase
          .from('expense_records')
          .select()
          .eq('vehicle_id', '9ebf96bd-fc6a-42c6-9a42-f9bebfa59b1c') // vehicleId
          .order('expense_date', ascending: false);
          print('😎$response');
      return response
          .map<ExpensesModel>((e) => ExpensesModel.fromJson(e))
          .toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

    @override
  Future<AddExpenseModel> getExpenseDetails(
    String expenseId,
  ) async {
    try {
      print('✅');
      final response = await _supabase
          .from('expense_records')
          .select()
          .eq('id', expenseId)
          .single();
print(' Data Source ✅ $response');
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
        .eq('vehicle_id', '9ebf96bd-fc6a-42c6-9a42-f9bebfa59b1c');

      double total = 0;

    double monthly = 0;
    double yearly = 0;
    double fuel = 0;
    double maintenance = 0;

  double insurance = 0;
  double oil = 0;
  double violation = 0;
  double other = 0;

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

      if (item['category'] == 'Fuel') {
        fuel += amount;
      }
      if (item['category'] == 'Traffic violation') {
        violation += amount;
      }
      if (item['category'] == 'Vehicle insurance') {
        insurance += amount;
      }
      if (item['category'] == 'Oil') {
        oil += amount;
      }

      if (item['category'] == 'Maintenance') {
        maintenance += amount;
      }
      
      if (item['category'] == 'Other') {
        other += amount;
      }

      print('👀');
      print('$response  👀');

    print('💕fuels 💕$fuel');
    print('💕maintenanceTotal 💕$maintenance');
    print('💕Violation 💕$violation');
    print('💕nsuranceTotal 💕$insurance');

    }
    return ExpenseStatsEntity(
      monthlyTotal: monthly,
      yearlyTotal: yearly,
      fuelTotal: fuel,
      maintenanceTotal: maintenance, 
      insuranceTotal: insurance, 
      oilTotal: oil, 
      violationTotal: violation, 
      otherTotal: other,
    );
  }
  
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
}
