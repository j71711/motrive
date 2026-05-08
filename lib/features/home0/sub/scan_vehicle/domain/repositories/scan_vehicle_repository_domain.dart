import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home0/sub/scan_vehicle/domain/entities/scan_vehicle_entity.dart';

abstract class ScanVehicleRepositoryDomain {
    // Future<Result<ScanVehicleEntity, Failure>> getScanVehicle();
    Future<Result<ScanVehicleEntity, Failure>> decodeVin(String vin);
}
