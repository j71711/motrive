import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/expenses/domain/entities/expense_stats_entity.dart';
import 'package:motrive/features/expenses/domain/entities/expenses_entity.dart';
import 'package:motrive/features/expenses/domain/repositories/expenses_repository_domain.dart';
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
}
