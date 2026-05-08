
import 'package:hive/hive.dart';
import 'package:motrive/features/home0/sub/add_car_card/data/models/add_car_card_model.dart';
import 'package:motrive/features/home0/sub/add_car_card/domain/repositories/add_car_card_repository_domain.dart';

// @LazySingleton(as: VehicleLocalDataSource)
class VehicleLocalDataSourceImpl implements VehicleLocalDataSource {
  final Box box;

  VehicleLocalDataSourceImpl(this.box);

  @override
  Future<void> cacheVehicles(List<VehicleModel> vehicles) async {
    final data = vehicles.map((e) => e.toJson()).toList();
    await box.put('vehicles', data);
  }

  @override
  List<VehicleModel> getCachedVehicles() {
    final data = box.get('vehicles', defaultValue: []);
    return (data as List).map((e) {
      return VehicleModel.fromJson(Map<String, dynamic>.from(e));
    }).toList();
  }


}