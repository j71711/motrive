import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/features/home/sub/add_car_card/data/models/add_car_card_model.dart';
import 'package:motrive/features/home/sub/add_car_card/data/models/car_info_model.dart';
import 'package:motrive/features/home/sub/add_car_card/domain/entities/add_car_card_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// remote data source
abstract class BaseAddCarCardRemoteDataSource {
  Future<List<AddCarCardModel>> getVehicles();
  Future<List<CarInfoModel>> getCarsInfo();
  Future<void> deleteVehicle(String id);
  Future<void> addVehicle(AddCarCardEntity vehicle);
}

//local data source
abstract class VehicleLocalDataSource {
  Future<void> cacheVehicles(List<AddCarCardModel> vehicles);
  List<AddCarCardModel> getCachedVehicles();
}

@LazySingleton(as: VehicleLocalDataSource)
class VehicleLocalDataSourceImpl implements VehicleLocalDataSource {
  final Box box;
  VehicleLocalDataSourceImpl(this.box);
  @override
  Future<void> cacheVehicles(List<AddCarCardModel> vehicles) async {
    final data = vehicles.map((e) => e.toJson()).toList();
    await box.put('vehicles', data);
  }

  @override
  List<AddCarCardModel> getCachedVehicles() {
    final data = box.get('vehicles', defaultValue: []);
    return (data as List)
        .map((e) => AddCarCardModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}

@LazySingleton(as: BaseAddCarCardRemoteDataSource)
class AddCarCardRemoteDataSource implements BaseAddCarCardRemoteDataSource {
  final SupabaseClient _supabase;

  AddCarCardRemoteDataSource(this._supabase);

  @override
  Future<List<AddCarCardModel>> getVehicles() async {
    //my eddit here...
    final userId = _supabase.auth.currentSession?.user.id;
    final response = await _supabase
        .from('vehicles')
        .select()
        .eq('user_id', userId!)
        .order('created_at');
    return response
        .map<AddCarCardModel>((e) => AddCarCardModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> deleteVehicle(String id) async {
    await _supabase.from('vehicles').delete().eq('id', id);
  }

  @override
  Future<void> addVehicle(AddCarCardEntity vehicle) async {
    await _supabase.from('vehicles').insert({
      'user_id': vehicle.userId,
      'make': vehicle.make,
      'model': vehicle.model,
      'year': vehicle.year,
      'color': vehicle.color,
      'license_plate': vehicle.licensePlate,
      'vin': vehicle.vin,
      'current_odometer': vehicle.currentOdometer,
      'car_info_id': vehicle.carInfoId,
    });
  }

  @override
  Future<List<CarInfoModel>> getCarsInfo() async {
    final response = await _supabase
        .from('cars_info')
        .select()
        .order('created_at');
    return response.map<CarInfoModel>((e) => CarInfoModel.fromJson(e)).toList();
  }
}
