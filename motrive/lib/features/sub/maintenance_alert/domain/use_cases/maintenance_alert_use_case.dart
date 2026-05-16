import 'package:motrive/features/maintenance/domain/entities/maintenance_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/sub/maintenance_alert/domain/repositories/maintenance_alert_repository_domain.dart';


@lazySingleton
class MaintenanceAlertUseCase {
  final MaintenanceAlertRepositoryDomain _repositoryData;

  MaintenanceAlertUseCase(this._repositoryData);

   Future<Result<MaintenanceEntity?, Failure>> getMaintenanceAlert() async {
    return _repositoryData.getMaintenanceAlert();
  }
}
