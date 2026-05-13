import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/home/sub/add_car_card/data/models/add_car_card_model.dart';
import 'package:motrive/features/maintenance_details/data/models/service_part_info/service_part_info_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/core/services/local_keys_service.dart';
import 'package:motrive/features/maintenance_details/data/models/maintenance_details/maintenance_details_model.dart';

abstract class BaseMaintenanceDetailsRemoteDataSource {
  Future<MaintenanceDetailsModel> getMaintenanceDetails(String serviceId);
}

@LazySingleton(as: BaseMaintenanceDetailsRemoteDataSource)
class MaintenanceDetailsRemoteDataSource
    implements BaseMaintenanceDetailsRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  final UserService _userService;

  MaintenanceDetailsRemoteDataSource(
    this._localKeysService,
    this._supabase,
    this._userService,
  );

  @override
  Future<MaintenanceDetailsModel> getMaintenanceDetails(
    String serviceId,
  ) async {
    final vehicle = await _supabase
        .from('vehicles')
        .select()
        .eq('user_id', '4fef5d57-eeb4-4bd7-aae0-eaf4dee00b1f');
    final parts = await _supabase
        .from('service_parts_info')
        .select()
        .eq('service_id', serviceId);
    return MaintenanceDetailsModel(
      id: serviceId,
      vehicle: VehicleModel.fromJson(vehicle.first),
      parts: parts.map((e) => ServicePartInfoModel.fromJson(e)).toList(),
    );
  }
}
