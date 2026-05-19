import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/maintenance/data/models/vehicle/vehicle_model.dart';
import 'package:motrive/features/maintenance_details/data/models/service_part_info/service_part_info_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/features/maintenance_details/data/models/maintenance_details/maintenance_details_model.dart';

abstract class BaseMaintenanceDetailsRemoteDataSource {
  Future<MaintenanceDetailsModel> getMaintenanceDetails(String serviceId);
}

@LazySingleton(as: BaseMaintenanceDetailsRemoteDataSource)
class MaintenanceDetailsRemoteDataSource
    implements BaseMaintenanceDetailsRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  MaintenanceDetailsRemoteDataSource(
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
        .eq('user_id', _userService.currentUser!.id);
    final parts = await _supabase
        .from('service_parts_info')
        .select()
        .eq('service_id', serviceId);
    return MaintenanceDetailsModel(
      id: serviceId,
      vehicle: UserVehicleModel.fromJson(vehicle.first),
      parts: parts.map((e) => ServicePartInfoModel.fromJson(e)).toList(),
    );
  }
}
