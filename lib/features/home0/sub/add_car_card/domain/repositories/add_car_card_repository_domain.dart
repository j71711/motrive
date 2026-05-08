import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home0/sub/add_car_card/data/models/add_car_card_model.dart';
import 'package:motrive/features/home0/sub/add_car_card/domain/entities/add_car_card_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class AddCarCardRepositoryDomain {
  Future<Result<void, Failure>> addVehicle(VehicleEntity vehicle);
  Future<Result<List<VehicleEntity>, Failure>> getVehicles();
  Future<Result<void, Failure>>  deleteVehicle(String id);
}


abstract class VehicleLocalDataSource {
  Future<void> cacheVehicles(List<VehicleModel> vehicles);
  List<VehicleModel> getCachedVehicles();
}