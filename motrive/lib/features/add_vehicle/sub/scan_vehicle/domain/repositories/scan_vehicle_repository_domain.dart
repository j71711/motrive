import 'package:motrive/features/add_vehicle/sub/scan_vehicle/domain/entities/scan_vehicle_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';

abstract class ScanVehicleRepositoryDomain {
    Future<Result<ScanVehicleEntity, Failure>> decodeVin(String vin);
    Future<Result<void, Failure>>  insertVehicle(ScanVehicleEntity vehicle);
}
