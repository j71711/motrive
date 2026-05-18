import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/sub/add_reminder/domain/entities/add_reminder_entity.dart';

import 'package:motrive/features/sub/add_reminder/data/datasources/add_reminder_remote_data_source.dart';
import 'package:motrive/features/sub/add_reminder/domain/repositories/add_reminder_repository_domain.dart';

@LazySingleton(as: AddReminderRepositoryDomain)
class AddReminderRepositoryData implements AddReminderRepositoryDomain {
  final BaseAddReminderRemoteDataSource remoteDataSource;

  AddReminderRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> getAddReminder(
    AddReminderEntity newReminder,
  ) async {
    try {
      await remoteDataSource.getAddReminder(newReminder);
      return Success(null);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> deleteReminder(
    String reminderId
  ) async {
    try {
      await remoteDataSource.deleteReminder(reminderId);
      return Success(null);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
