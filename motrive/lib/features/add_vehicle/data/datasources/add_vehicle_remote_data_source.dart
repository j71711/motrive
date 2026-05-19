import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/maintenance/data/models/vehicle/vehicle_model.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseAddVehicleRemoteDataSource {
  Future<UserVehicleModel> getAddVehicle(UserVehicleEntity vehicle);
  Future<void> updateVehicle(UserVehicleEntity vehicle);
  Future<void> deleteVehicle(UserVehicleEntity vehicle);
}

@LazySingleton(as: BaseAddVehicleRemoteDataSource)
class AddVehicleRemoteDataSource implements BaseAddVehicleRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  AddVehicleRemoteDataSource(this._supabase, this._userService);

  @override
  Future<UserVehicleModel> getAddVehicle(UserVehicleEntity vehicle) async {
    final userCar = await _supabase
        .from('vehicles')
        .insert({
          'user_id': _userService.currentUser!.id,
          'make': vehicle.make,
          'model': vehicle.model,
          'year': vehicle.year,
          'color': vehicle.color,
          'license_plate': vehicle.licensePlate,
          'vin': vehicle.vin,
          'current_odometer': vehicle.currentOdometer,
          'car_info_id': vehicle.carInfoId,
          'odometer_at_registered':vehicle.currentOdometer
        })
        .select()
        .single();
    _userService.setVehicle = UserVehicleModel.fromJson(userCar);
    return _userService.currentVehicle!;
  }

  @override
  Future<void> updateVehicle(UserVehicleEntity vehicle) async {
    final userCar = await _supabase
        .from('vehicles')
        .update({
          'make': vehicle.make,
          'model': vehicle.model,
          'year': vehicle.year,
          'color': vehicle.color,
          'license_plate': vehicle.licensePlate,
          'vin': vehicle.vin,
        })
        .eq('id', vehicle.id!)
        .select()
        .single();
    _userService.setVehicle = UserVehicleModel.fromJson(userCar);
  }

  @override
  Future<void> deleteVehicle(UserVehicleEntity vehicle) async {
    await _supabase
        .from('vehicles')
        .delete()
        .eq('id', vehicle.id!);
    _userService.setVehicle = null;
  }
}
