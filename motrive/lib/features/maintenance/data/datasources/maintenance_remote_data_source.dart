import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/maintenance/data/models/car_info/car_info_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/core/services/local_keys_service.dart';
import 'package:motrive/features/maintenance/data/models/maintenance/maintenance_model.dart';

abstract class BaseMaintenanceRemoteDataSource {
  Future<MaintenanceModel> getMaintenance();
}

@LazySingleton(as: BaseMaintenanceRemoteDataSource)
class MaintenanceRemoteDataSource implements BaseMaintenanceRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  final UserService _userService;

  MaintenanceRemoteDataSource(
    this._localKeysService,
    this._supabase,
    this._userService,
  );

  @override
  Future<MaintenanceModel> getMaintenance() async {
    final userCars = await _supabase
        .from('vehicles')
        .select()
        .eq('user_id', '4fef5d57-eeb4-4bd7-aae0-eaf4dee00b1f');

    if (userCars.isEmpty) {
      throw Exception('No car found');
    } else if (userCars.first['car_info_id'] == null) {
      throw Exception('No maintenance found');
    }

    final carInfo = await _supabase
        .from('cars_info')
        .select()
        .eq('id', userCars.first['car_info_id'])
        .maybeSingle();

    final car = CarInfoModel.fromJson(carInfo!);

    final carServices = await _supabase
        .from('services_info')
        .select()
        .eq('car_id', car.id)
        .order('service_odometer');

    return MaintenanceModel.fromJson({'car_info' : carInfo, 'services': carServices});
  }
}
