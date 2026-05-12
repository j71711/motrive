import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/user_services.dart';
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
    final parts = await _supabase
        .from('service_parts_info')
        .select()
        .eq('service_id', serviceId);
    return MaintenanceDetailsModel(
      id: serviceId,
      parts: parts.map((e) => ServicePartInfoModel.fromJson(e)).toList(),
    );
  }
}
