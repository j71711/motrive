import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home/sub/add_expense/domain/entities/add_expense_entity.dart';

abstract class AddExpenseRepositoryDomain {
    Future<Result<void, Failure>> addExpense(AddExpenseEntity entity);
}
