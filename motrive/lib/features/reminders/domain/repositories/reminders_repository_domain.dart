import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/reminders/domain/entities/reminders_entity.dart';

abstract class RemindersRepositoryDomain {
    Future<Result<List<RemindersEntity>, Failure>> getReminders();
}
