import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home/sub/add_expense/domain/entities/add_expense_entity.dart';
import 'package:motrive/features/home/sub/add_expense/domain/repositories/add_expense_repository_domain.dart';


@lazySingleton
class AddExpenseUseCase {
  final AddExpenseRepositoryDomain _repositoryData;

  AddExpenseUseCase(this._repositoryData);

   Future<Result<void, Failure>> addExpense(AddExpenseEntity entity,) async {
    return _repositoryData.addExpense(entity);
  }

  // Future<Result<void, Failure>> addExpense(
  //   AddExpenseEntity entity,
  // ) {
  //   return _repositoryData.addExpense(entity);
  // }

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
    return _repositoryData.getExpenseDetails(
      expenseId,
    );
  }


}
