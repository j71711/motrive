import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';

abstract class AddVehicleRepositoryDomain {
  Future<Result<void, Failure>> getAddVehicle(UserVehicleEntity vehicle);
  Future<Result<void, Failure>> updateVehicle(UserVehicleEntity vehicle);
  Future<Result<void, Failure>> deleteVehicle(UserVehicleEntity vehicle);
}
