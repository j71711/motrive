
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/maintenance/domain/entities/maintenance_entity.dart';

import 'package:motrive/features/maintenance/data/datasources/maintenance_remote_data_source.dart';
import 'package:motrive/features/maintenance/data/models/maintenance/maintenance_model.dart';
import 'package:motrive/features/maintenance/domain/repositories/maintenance_repository_domain.dart';

@LazySingleton(as: MaintenanceRepositoryDomain)
class MaintenanceRepositoryData implements MaintenanceRepositoryDomain{
  final BaseMaintenanceRemoteDataSource remoteDataSource;


  MaintenanceRepositoryData(this.remoteDataSource);

@override
  Future<Result<MaintenanceEntity, Failure>> getMaintenance() async {
    try {
      final response = await remoteDataSource.getMaintenance();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
