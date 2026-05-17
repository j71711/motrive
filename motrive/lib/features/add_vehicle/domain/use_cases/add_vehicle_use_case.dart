import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/add_vehicle/domain/repositories/add_vehicle_repository_domain.dart';


@lazySingleton
class AddVehicleUseCase {
  final AddVehicleRepositoryDomain _repositoryData;

  AddVehicleUseCase(this._repositoryData);

   Future<Result<void, Failure>> getAddVehicle(UserVehicleEntity vehicle) async {
    return _repositoryData.getAddVehicle(vehicle);
  }
}
