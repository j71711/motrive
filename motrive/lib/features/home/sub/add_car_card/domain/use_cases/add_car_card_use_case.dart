import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home/sub/add_car_card/domain/entities/add_car_card_entity.dart';
import 'package:motrive/features/home/sub/add_car_card/domain/repositories/add_car_card_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class AddCarCardUseCase {
  final AddCarCardRepositoryDomain _repositoryData;

  AddCarCardUseCase(this._repositoryData);

  Future<Result<void, Failure>> deleteVehicle(String id) {
    return _repositoryData.deleteVehicle(id);
  }

  Future<List<AddCarCardEntity>> searchVehicles(
    List<AddCarCardEntity> vehicles,
    String query,
  ) async {
    return vehicles.where((vehicle) {
      return vehicle.make!.toLowerCase().contains(query.toLowerCase()) ||
          vehicle.model!.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  Future<Result<List<AddCarCardEntity>, Failure>> getVehicles() async {
    try {
      final vehicles = await _repositoryData.getVehicles();
      return vehicles;
    } catch (e) {
      rethrow;
    }
  }

  Future<Result<void, Failure>> addVehicle(AddCarCardEntity vehicle) {
    return _repositoryData.addVehicle(vehicle);
  }

  Future<Result<List<CarInfoEntity>, Failure>> getCarsInfo() {
  return _repositoryData.getCarsInfo();
}

}

