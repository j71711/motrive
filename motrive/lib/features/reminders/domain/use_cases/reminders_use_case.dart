import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/reminders/domain/entities/reminders_entity.dart';
import 'package:motrive/features/reminders/domain/repositories/reminders_repository_domain.dart';


@lazySingleton
class RemindersUseCase {
  final RemindersRepositoryDomain _repositoryData;

  RemindersUseCase(this._repositoryData);

   Future<Result<List<RemindersEntity>, Failure>> getReminders() async {
    return _repositoryData.getReminders();
  }
}
