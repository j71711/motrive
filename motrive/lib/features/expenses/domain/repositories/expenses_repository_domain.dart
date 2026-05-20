import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/expenses/domain/entities/expense_stats_entity.dart';
import 'package:motrive/features/expenses/domain/entities/expenses_entity.dart';
import 'package:motrive/features/home/sub/add_expense/domain/entities/add_expense_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ExpensesRepositoryDomain {
    Future<Result<List<ExpensesEntity>, Failure>> getExpenses();
    Future<Result<ExpenseStatsEntity, Failure>> getExpenseStats();
    Future<Result<void, Failure>> addExpense(AddExpenseEntity entity);
    Future<Result<void, Failure>> updateExpense(AddExpenseEntity entity);
    Future<Result<void, Failure>> deleteExpense(String expenseId);
    Future<Result<AddExpenseEntity, Failure>> getExpenseDetails(String expenseId,);
}
