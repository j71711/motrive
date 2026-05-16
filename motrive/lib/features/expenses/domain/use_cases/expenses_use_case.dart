import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/expenses/domain/entities/expenses_entity.dart';
import 'package:motrive/features/expenses/domain/repositories/expenses_repository_domain.dart';


@lazySingleton
class ExpensesUseCase {
  final ExpensesRepositoryDomain _repositoryData;

  ExpensesUseCase(this._repositoryData);

   Future<Result<ExpensesEntity, Failure>> getExpenses() async {
    return _repositoryData.getExpenses();
  }
}
