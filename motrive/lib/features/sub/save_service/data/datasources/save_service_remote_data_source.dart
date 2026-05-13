import 'package:injectable/injectable.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';
import 'package:motrive/features/maintenance_details/domain/entities/maintenance_save_info.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/core/services/local_keys_service.dart';

abstract class BaseSaveServiceRemoteDataSource {
  Future<void> getSaveService(
    ServiceInfoEntity serviceInfo,
    MaintenanceSaveInfo maintenanceSaveInfo,
    String carId,
  );
}

@LazySingleton(as: BaseSaveServiceRemoteDataSource)
class SaveServiceRemoteDataSource implements BaseSaveServiceRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  SaveServiceRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<void> getSaveService(
    ServiceInfoEntity serviceInfo,
    MaintenanceSaveInfo maintenanceSaveInfo,
    String carId,
  ) async {
    await _supabase.from('maintenance_logs').insert({
      'user_id': '4fef5d57-eeb4-4bd7-aae0-eaf4dee00b1f',
      'vehicle_id': carId,
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
      'vehicle_id': carId,
      'category': 'service',
      'odometer_at_expense': maintenanceSaveInfo.odometerAtService,
      'cost': maintenanceSaveInfo.cost,
      'notes': maintenanceSaveInfo.note,
      'expense_date': maintenanceSaveInfo.serviceDate.toIso8601String(),
    });
  }
}
