import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home/sub/add_car_card/domain/entities/add_car_card_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class AddCarCardRepositoryDomain {
  Future<Result<List<VehicleEntity>, Failure>> getVehicles();
  Future<Result<void, Failure>>  deleteVehicle(String id);
}
