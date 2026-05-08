import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home0/sub/add_car_card/data/models/add_car_card_model.dart';
import 'package:motrive/features/home0/sub/add_car_card/domain/entities/add_car_card_entity.dart';
import 'package:motrive/features/home0/sub/add_car_card/domain/repositories/add_car_card_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class AddCarCardUseCase {
  final AddCarCardRepositoryDomain _repositoryData;

  AddCarCardUseCase(this._repositoryData);
  Future<void> addVehicle(VehicleEntity vehicle) {
    return _repositoryData.addVehicle(vehicle);
  }
    Future<void> deleteVehicle(String id) {
      return _repositoryData.deleteVehicle(id);
    }
Future<List<VehicleEntity>> searchVehicles(
  List<VehicleEntity> vehicles,
  String query,
) async {
  return await vehicles.where((vehicle) {
    return vehicle.make
            .toLowerCase()
            .contains(query.toLowerCase()) ||
        vehicle.model
            .toLowerCase()
            .contains(query.toLowerCase());
  }).toList();
}

  Future<Result<List<VehicleEntity>, Failure>>  getVehicles() async {
    try {
      final vehicles = await _repositoryData.getVehicles();
      return vehicles ;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}

@lazySingleton
class AddCarUseCase0 {
  final VehicleLocalDataSource _repositoryData;
  AddCarUseCase0(this._repositoryData);
    Future<List<VehicleModel>> getCachedVehicles() async {
       final vehicles = await _repositoryData.getCachedVehicles();
      return vehicles ;
    }
  Future<List<VehicleModel>> getVehicles() async {
    final vehicles = await _repositoryData.getCachedVehicles();
    return vehicles;
  }
}

