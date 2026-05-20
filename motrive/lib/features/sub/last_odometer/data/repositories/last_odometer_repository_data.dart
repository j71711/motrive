import 'package:injectable/injectable.dart';
import 'package:motrive/features/maintenance/data/models/vehicle/vehicle_model.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';

import 'package:motrive/features/sub/last_odometer/data/datasources/last_odometer_remote_data_source.dart';
import 'package:motrive/features/sub/last_odometer/domain/repositories/last_odometer_repository_domain.dart';

@LazySingleton(as: LastOdometerRepositoryDomain)
class LastOdometerRepositoryData implements LastOdometerRepositoryDomain {
  final BaseLastOdometerRemoteDataSource remoteDataSource;

  LastOdometerRepositoryData(this.remoteDataSource);

  @override
  Stream<Result<UserVehicleEntity, Failure>> getLastOdometer() {
    return remoteDataSource
        .getLastOdometer()
        .map<Result<UserVehicleEntity, Failure>>(
          (event) => Success(event.toEntity()),
        )
        .handleError((error) => Error(FailureExceptions.getException(error)));
  }
}
