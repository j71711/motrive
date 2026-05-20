import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/sub/last_odometer/domain/repositories/last_odometer_repository_domain.dart';


@lazySingleton
class LastOdometerUseCase {
  final LastOdometerRepositoryDomain _repositoryData;

  LastOdometerUseCase(this._repositoryData);

   Stream<Result<UserVehicleEntity, Failure>> getLastOdometer() {
    return _repositoryData.getLastOdometer();
  }
}
