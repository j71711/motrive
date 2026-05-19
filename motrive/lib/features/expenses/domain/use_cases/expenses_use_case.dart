import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/expenses/domain/entities/expense_stats_entity.dart';
import 'package:motrive/features/expenses/domain/entities/expenses_entity.dart';
import 'package:motrive/features/expenses/domain/repositories/expenses_repository_domain.dart';
import 'package:motrive/features/home/sub/add_expense/domain/entities/add_expense_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ExpensesUseCase {
  final ExpensesRepositoryDomain _repositoryData;

  ExpensesUseCase(this._repositoryData);

    Future<Result<List<ExpensesEntity>, Failure>> getExpenses(String vehicleId) async {
    return _repositoryData.getExpenses(vehicleId);
  }

   Future<Result<ExpenseStatsEntity, Failure>> getExpenseStats(String vehicleId) async {
    return _repositoryData.getExpenseStats(vehicleId);
  }

  Future<Result<void, Failure>> addExpense(
    AddExpenseEntity entity,
  ) {
    return _repositoryData.addExpense(entity);
  }

  Future<Result<void, Failure>> updateExpense(
    AddExpenseEntity entity,
  ) {
    return _repositoryData.updateExpense(entity);
  }

  Future<Result<void, Failure>> deleteExpense(
    String expenseId,
  ) {
    return _repositoryData.deleteExpense(expenseId);
  }

  Future<Result<AddExpenseEntity, Failure>>
      getExpenseDetails(
    String expenseId,
  ) {
    print('Use Case ❤️'); 
     final x  = _repositoryData.getExpenseDetails(
      expenseId,
    );
    print('$x 🆕');
    return x;
  }

}
