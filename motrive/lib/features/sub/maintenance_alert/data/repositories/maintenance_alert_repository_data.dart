import 'package:injectable/injectable.dart';
import 'package:motrive/features/maintenance/data/models/maintenance/maintenance_model.dart';
import 'package:motrive/features/maintenance/domain/entities/maintenance_entity.dart';
import 'package:motrive/features/sub/maintenance_alert/data/datasources/maintenance_alert_local_data_source.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/sub/maintenance_alert/data/datasources/maintenance_alert_remote_data_source.dart';
import 'package:motrive/features/sub/maintenance_alert/domain/repositories/maintenance_alert_repository_domain.dart';

@LazySingleton(as: MaintenanceAlertRepositoryDomain)
class MaintenanceAlertRepositoryData
    implements MaintenanceAlertRepositoryDomain {
  final BaseMaintenanceAlertRemoteDataSource remoteDataSource;
  final BaseMaintenanceAlertLocalDataSource localDataSource;

  MaintenanceAlertRepositoryData(this.remoteDataSource, this.localDataSource);

  @override
  Future<Result<MaintenanceEntity?, Failure>> getMaintenanceAlert() async {
    try {
      final local = await localDataSource.getMaintenanceAlert();
        if (local != null && local.services.isNotEmpty) {
          return Success(local.toEntity());
        }

      final response = await remoteDataSource.getMaintenanceAlert();
      return Success(response?.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
