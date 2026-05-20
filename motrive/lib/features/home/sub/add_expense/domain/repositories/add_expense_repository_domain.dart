import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home/sub/add_expense/domain/entities/add_expense_entity.dart';

abstract class AddExpenseRepositoryDomain {
  Future<Result<void, Failure>> addExpense(AddExpenseEntity entity);
  Future<Result<void, Failure>> updateExpense(AddExpenseEntity entity);
  Future<Result<void, Failure>> deleteExpense(String expenseId);
  Future<Result<AddExpenseEntity, Failure>> getExpenseDetails(String expenseId);
  Result<UserVehicleEntity, Failure> getUserVehicle();
}
