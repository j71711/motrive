import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/local_keys_service.dart';
import 'package:motrive/features/home/sub/add_car_card/data/models/add_car_card_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// remote data source
abstract class BaseAddCarCardRemoteDataSource {
  Future<List<VehicleModel>> getVehicles();
  Future<void> deleteVehicle(String id);
}

//local data source
abstract class VehicleLocalDataSource {
  Future<void> cacheVehicles(List<VehicleModel> vehicles);
  List<VehicleModel> getCachedVehicles();
}

@LazySingleton(as: VehicleLocalDataSource)
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
    // return

return (data as List)
    .map(
      (e) => VehicleModel.fromJson(
        Map<String, dynamic>.from(e),
      ),
    )
    .toList();
  }
}

@LazySingleton(as: BaseAddCarCardRemoteDataSource)
class AddCarCardRemoteDataSource implements BaseAddCarCardRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  AddCarCardRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<List<VehicleModel>> getVehicles() async {
    final response = await _supabase
        .from('vehicles')
        .select()
        .eq('user_id', '94fc1635-d17d-442a-885d-a3c3cd67af0d')
        .order('created_at');
    return response.map<VehicleModel>((e) => VehicleModel.fromJson(e)).toList();
  }

  @override
  Future<void> deleteVehicle(String id) async {
    await _supabase.from('vehicles').delete().eq('id', id);
  }
}
