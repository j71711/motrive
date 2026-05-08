import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/core/services/local_keys_service.dart';
import 'package:motrive/features/home0/sub/scan_vehicle/data/models/scan_vehicle_model.dart';


abstract class BaseScanVehicleRemoteDataSource {
  // Future<ScanVehicleModel> getScanVehicle();
  Future<ScanVehicleModel> decodeVin(String vin);
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
      body: {
        'vin': vin,
      },
    );

    return ScanVehicleModel.fromJson(response.data);
  }


  //   @override
  // Future<ScanVehicleModel> getScanVehicle() async {
  //   try {
  //     return ScanVehicleModel(id: 1, firstName: "Last Name", lastName: "First Name");
  //   } catch (error) {
  //    throw FailureExceptions.getException(error);
  //   }
  // }
}




