import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/expenses/domain/entities/expenses_entity.dart';

abstract class ExpensesRepositoryDomain {
    Future<Result<ExpensesEntity, Failure>> getExpenses();
}
