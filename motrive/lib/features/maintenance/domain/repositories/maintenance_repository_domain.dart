import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/maintenance/domain/entities/maintenance_entity.dart';

abstract class MaintenanceRepositoryDomain {
  Future<Result<MaintenanceEntity, Failure>> getMaintenance({
    required bool fromRemote,
  });
  Stream<Result<String, Failure>> processData(UserVehicleEntity vehicle);
}
