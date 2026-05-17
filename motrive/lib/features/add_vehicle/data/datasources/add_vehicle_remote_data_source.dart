import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseAddVehicleRemoteDataSource {
  Future<void> getAddVehicle(UserVehicleEntity vehicle);
}

@LazySingleton(as: BaseAddVehicleRemoteDataSource)
class AddVehicleRemoteDataSource implements BaseAddVehicleRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  AddVehicleRemoteDataSource(this._supabase, this._userService);

  @override
  Future<void> getAddVehicle(UserVehicleEntity vehicle) async {
    await _supabase.from('vehicles').insert({
      'user_id': _userService.currentUser!.id,
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
}
