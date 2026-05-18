
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/reminders/domain/entities/reminders_entity.dart';

import 'package:motrive/features/reminders/data/datasources/reminders_remote_data_source.dart';
import 'package:motrive/features/reminders/data/models/reminders_model.dart';
import 'package:motrive/features/reminders/domain/repositories/reminders_repository_domain.dart';

@LazySingleton(as: RemindersRepositoryDomain)
class RemindersRepositoryData implements RemindersRepositoryDomain{
  final BaseRemindersRemoteDataSource remoteDataSource;


  RemindersRepositoryData(this.remoteDataSource);

@override
  Future<Result<List<RemindersEntity>, Failure>> getReminders() async {
    try {
      final response = await remoteDataSource.getReminders();
      return Success(response.map((e) => e.toEntity(),).toList());
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
