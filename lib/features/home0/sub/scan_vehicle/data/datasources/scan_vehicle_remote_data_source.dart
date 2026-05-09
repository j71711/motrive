import 'package:injectable/injectable.dart';
import 'package:motrive/features/home0/sub/scan_vehicle/domain/entities/scan_vehicle_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/core/services/local_keys_service.dart';
import 'package:motrive/features/home0/sub/scan_vehicle/data/models/scan_vehicle_model.dart';

abstract class BaseScanVehicleRemoteDataSource {
  Future<ScanVehicleModel> decodeVin(String vin);
  Future<void> insertVehicle(ScanVehicleEntity vehicle);
}

@LazySingleton(as: BaseScanVehicleRemoteDataSource)
class ScanVehicleRemoteDataSource implements BaseScanVehicleRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  ScanVehicleRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<ScanVehicleModel> decodeVin(String vin) async {
    final response = await _supabase.functions.invoke(
      'decode-vin',
      body: {'vin': vin},
      //       headers: {
      //   'Authorization':
      //       'Bearer ${Supabase.instance.client.auth.currentSession?.accessToken}',
      // },
    );
    final data = Map<String, dynamic>.from(response.data);
    return ScanVehicleModel.fromJson(data);
  }
  
@override
Future<void> insertVehicle(ScanVehicleEntity vehicle) async {
 await _supabase.from('vehicles').insert({
    'vin': vehicle.vin,
    'make': vehicle.make,
    'model': vehicle.model,
    'year': vehicle.year,
    'user_id': '94fc1635-d17d-442a-885d-a3c3cd67af0d', 
  });
}
}
