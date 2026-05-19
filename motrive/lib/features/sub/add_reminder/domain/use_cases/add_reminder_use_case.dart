import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/sub/add_reminder/domain/entities/add_reminder_entity.dart';
import 'package:motrive/features/sub/add_reminder/domain/repositories/add_reminder_repository_domain.dart';

@lazySingleton
class AddReminderUseCase {
  final AddReminderRepositoryDomain _repositoryData;

  AddReminderUseCase(this._repositoryData);

  Future<Result<void, Failure>> getAddReminder(
    AddReminderEntity newReminder,
  ) async {
    return _repositoryData.getAddReminder(newReminder);
  }

  Future<Result<void, Failure>> deleteReminder(String reminderId) async {
    return _repositoryData.deleteReminder(reminderId);
  }
}
