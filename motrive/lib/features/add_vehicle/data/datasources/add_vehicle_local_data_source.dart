import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/constants/app_hive_keys.dart';
import 'package:motrive/features/maintenance/data/models/vehicle/vehicle_model.dart';

abstract class BaseAddVehicleLocalDataSource {
  Future<void> getAddVehicle(UserVehicleModel vehicle);
  Future<void> deleteVehicle();
}

@LazySingleton(as: BaseAddVehicleLocalDataSource)
class AddVehicleLocalDataSource implements BaseAddVehicleLocalDataSource {
  final Box _box;

  AddVehicleLocalDataSource(this._box);

  @override
  Future<void> getAddVehicle(UserVehicleModel vehicle) async {
    await _box.put(HiveBoxes.vehicles, [vehicle.toJson()]);
  }

  @override
  Future<void> deleteVehicle() async {
    await _box.delete(HiveBoxes.vehicles);
    await _box.delete(HiveBoxes.servicesInfo);
  }
}
