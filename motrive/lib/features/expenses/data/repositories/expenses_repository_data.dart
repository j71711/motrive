import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/features/expenses/data/datasources/expenses_remote_data_source.dart';
import 'package:motrive/features/expenses/data/models/expenses_model.dart';
import 'package:motrive/features/expenses/domain/entities/add_expense_entity.dart';
import 'package:motrive/features/expenses/domain/entities/expense_stats_entity.dart';
import 'package:motrive/features/expenses/domain/entities/expenses_entity.dart';
import 'package:motrive/features/expenses/domain/repositories/expenses_repository_domain.dart';
import 'package:motrive/features/home/sub/add_expense/domain/entities/add_expense_entity.dart';
import 'package:multiple_result/multiple_result.dart';

@LazySingleton(as: ExpensesRepositoryDomain)
class ExpensesRepositoryData implements ExpensesRepositoryDomain{
  final BaseExpensesRemoteDataSource remoteDataSource;


  ExpensesRepositoryData(this.remoteDataSource);

  @override
  Future<Result<ExpenseStatsEntity, Failure>> getExpenseStats() async {
   try{
    final response = await remoteDataSource.getExpenseStats();
    
      return Success(response);
   }
   catch(error){
      return Error(FailureExceptions.getException(error));
   }
  }

  @override
  Future<Result<List<ExpensesEntity>, Failure>> getExpenses() async{
    try{
      final response = await remoteDataSource.getExpenses();
      final entities = response.map((item) => item.toEntity()).toList();
print('😏$response');
print('😏$entities');
      return Success(entities);
    }
    catch(error){
      return Error(FailureExceptions.getException(error));
    }
  }


    @override
  Future<Result<void, Failure>> addExpense(
    AddExpenseEntity entity,
  ) async {
    try {
      await remoteDataSource.addExpense(entity.toModel());

      return const Success(unit);
    } catch (error) {
      return Error(
        FailureExceptions.getException(error),
      );
    }
  }

  
  @override
  Future<Result<void, Failure>> deleteExpense(String expenseId) async {
    try {
      await remoteDataSource.deleteExpense(expenseId);
      return const Success(unit);
    } catch (error) {
      return Error(
        FailureExceptions.getException(error),
      );
    }
  }
  
  @override
  getExpenseDetails(String expenseId) async {
    try{final response = await remoteDataSource.getExpenseDetails(
        expenseId,
      );
      return Success(response.toEntity());
    }
    catch(error){
      return Error(FailureExceptions.getException(error),);
    }
  }
  
  @override
  Future<Result<void, Failure>> updateExpense(AddExpenseEntity entity) async {
    try {
      await remoteDataSource.updateExpense(entity.toModel());

      return const Success(unit);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}


