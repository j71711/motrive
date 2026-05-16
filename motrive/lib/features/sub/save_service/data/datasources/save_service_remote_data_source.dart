import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/local_notification_service.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:motrive/features/maintenance_details/domain/entities/maintenance_save_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseSaveServiceRemoteDataSource {
  Future<void> getSaveService(
    ServiceInfoEntity serviceInfo,
    MaintenanceSaveInfo maintenanceSaveInfo,
    UserVehicleEntity vehicle,
  );
}

@LazySingleton(as: BaseSaveServiceRemoteDataSource)
class SaveServiceRemoteDataSource implements BaseSaveServiceRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;
  final LocalNotificationService _localNotificationService;

  SaveServiceRemoteDataSource(
    this._supabase,
    this._userService,
    this._localNotificationService,
  );

  @override
  Future<void> getSaveService(
    ServiceInfoEntity serviceInfo,
    MaintenanceSaveInfo maintenanceSaveInfo,
    UserVehicleEntity vehicle,
  ) async {
    await _supabase.from('maintenance_logs').insert({
      'user_id': _userService.currentUser!.id,
      'vehicle_id': vehicle.id,
      'service_id': serviceInfo.id,
      'service_type': serviceInfo.severity,
      'odometer_at_service': maintenanceSaveInfo.odometerAtService,
      'cost': maintenanceSaveInfo.cost,
      'provider_name': maintenanceSaveInfo.providerName,
      'notes': maintenanceSaveInfo.note,
      'service_date': maintenanceSaveInfo.serviceDate.toIso8601String(),
    });

    await _supabase.from('expense_records').insert({
      'user_id': '4fef5d57-eeb4-4bd7-aae0-eaf4dee00b1f',
      'vehicle_id': vehicle.id,
      'category': 'service',
      'odometer_at_expense': maintenanceSaveInfo.odometerAtService,
      'cost': maintenanceSaveInfo.cost,
      'notes': maintenanceSaveInfo.note,
      'expense_date': maintenanceSaveInfo.serviceDate.toIso8601String(),
    });

    await _supabase
        .from('vehicles')
        .update({'current_odometer': maintenanceSaveInfo.odometerAtService})
        .eq('user_id', _userService.currentUser!.id);

    await _localNotificationService.maintenanceCompletedNotification(
      carName: vehicle.model,
      serviceType: serviceInfo.severity,
    );
  }
}
