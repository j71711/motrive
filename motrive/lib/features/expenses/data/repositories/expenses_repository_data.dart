
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/expenses/domain/entities/expenses_entity.dart';

import 'package:motrive/features/expenses/data/datasources/expenses_remote_data_source.dart';
import 'package:motrive/features/expenses/data/models/expenses_model.dart';
import 'package:motrive/features/expenses/domain/repositories/expenses_repository_domain.dart';

@LazySingleton(as: ExpensesRepositoryDomain)
class ExpensesRepositoryData implements ExpensesRepositoryDomain{
  final BaseExpensesRemoteDataSource remoteDataSource;


  ExpensesRepositoryData(this.remoteDataSource);

@override
  Future<Result<ExpensesEntity, Failure>> getExpenses() async {
    try {
      final response = await remoteDataSource.getExpenses();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
