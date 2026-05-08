import 'package:injectable/injectable.dart';
import 'package:motrive/features/home0/sub/scan_vehicle/data/models/scan_vehicle_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home0/sub/scan_vehicle/domain/entities/scan_vehicle_entity.dart';
import 'package:motrive/features/home0/sub/scan_vehicle/data/datasources/scan_vehicle_remote_data_source.dart';
import 'package:motrive/features/home0/sub/scan_vehicle/domain/repositories/scan_vehicle_repository_domain.dart';

@LazySingleton(as: ScanVehicleRepositoryDomain)
class ScanVehicleRepositoryData implements ScanVehicleRepositoryDomain{
  final BaseScanVehicleRemoteDataSource remoteDataSource;


  ScanVehicleRepositoryData(this.remoteDataSource);

@override
  Future<Result<ScanVehicleEntity, Failure>> decodeVin(
    String vin,
  ) async {
    try {
      final response = await remoteDataSource.decodeVin(vin);
      return Success(response.toEntity());
    } catch (e) {
      return Error(
        FailureExceptions.getException(e),
      );
    }
  }

// @override
//   Future<Result<ScanVehicleEntity, Failure>> getScanVehicle() async {
//     try {
//       final response = await remoteDataSource.getScanVehicle();
//       return Success(response.toEntity());
//     } catch (error) {
//       return Error(FailureExceptions.getException(error));
//     }
//   }
}
