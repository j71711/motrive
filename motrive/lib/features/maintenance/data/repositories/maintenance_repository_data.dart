
import 'package:injectable/injectable.dart';
import 'package:motrive/features/maintenance/data/datasources/maintenance_local_data_source.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/maintenance/domain/entities/maintenance_entity.dart';

import 'package:motrive/features/maintenance/data/datasources/maintenance_remote_data_source.dart';
import 'package:motrive/features/maintenance/data/models/maintenance/maintenance_model.dart';
import 'package:motrive/features/maintenance/domain/repositories/maintenance_repository_domain.dart';

@LazySingleton(as: MaintenanceRepositoryDomain)
class MaintenanceRepositoryData implements MaintenanceRepositoryDomain {
  final BaseMaintenanceRemoteDataSource remoteDataSource;
  final BaseMaintenanceLocalDataSource localDataSource;

  MaintenanceRepositoryData(this.remoteDataSource, this.localDataSource);

  @override
  Future<Result<MaintenanceEntity, Failure>> getMaintenance({
    required bool fromRemote,
  }) async {
    try {
      if (!fromRemote) {
        final local = await localDataSource.getMaintenance();
        if (local != null && local.services.isNotEmpty) {
          return Success(local.toEntity());
        }
      }

      final remote = await remoteDataSource.getMaintenance();
      await localDataSource.saveMaintenance(remote);

      return Success(remote.toEntity());
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
