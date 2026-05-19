import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/sub/add_reminder/domain/entities/add_reminder_entity.dart';

abstract class AddReminderRepositoryDomain {
  Future<Result<void, Failure>> getAddReminder(AddReminderEntity newReminder);
  Future<Result<void, Failure>> deleteReminder(String reminderId);
}
