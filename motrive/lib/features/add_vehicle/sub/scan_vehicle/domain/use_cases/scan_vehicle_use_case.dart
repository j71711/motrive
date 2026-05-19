import 'package:motrive/features/add_vehicle/sub/scan_vehicle/domain/entities/scan_vehicle_entity.dart';
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/domain/repositories/scan_vehicle_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';


@lazySingleton
class ScanVehicleUseCase {
  final ScanVehicleRepositoryDomain _repositoryData;

  ScanVehicleUseCase(this._repositoryData);

  Future<Result<ScanVehicleEntity, Failure>> decodeVin(String vin) async {
    return await _repositoryData.decodeVin(vin);
  }

Future<Result<void, Failure>> insertVehicle(ScanVehicleEntity vehicle) {
  return _repositoryData.insertVehicle(vehicle);
}
}

