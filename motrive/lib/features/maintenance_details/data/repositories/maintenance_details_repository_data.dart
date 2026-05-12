
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/maintenance_details/domain/entities/maintenance_details_entity.dart';

import 'package:motrive/features/maintenance_details/data/datasources/maintenance_details_remote_data_source.dart';
import 'package:motrive/features/maintenance_details/data/models/maintenance_details/maintenance_details_model.dart';
import 'package:motrive/features/maintenance_details/domain/repositories/maintenance_details_repository_domain.dart';

@LazySingleton(as: MaintenanceDetailsRepositoryDomain)
class MaintenanceDetailsRepositoryData implements MaintenanceDetailsRepositoryDomain{
  final BaseMaintenanceDetailsRemoteDataSource remoteDataSource;


  MaintenanceDetailsRepositoryData(this.remoteDataSource);

@override
  Future<Result<MaintenanceDetailsEntity, Failure>> getMaintenanceDetails(String serviceId) async {
    try {
      final response = await remoteDataSource.getMaintenanceDetails(serviceId);
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
