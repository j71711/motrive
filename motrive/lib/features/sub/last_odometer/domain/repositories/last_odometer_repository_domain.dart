import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';

abstract class LastOdometerRepositoryDomain {
    Stream<Result<UserVehicleEntity, Failure>> getLastOdometer();
}
