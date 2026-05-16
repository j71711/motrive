import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/local_notification_service.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/maintenance/data/models/maintenance/maintenance_model.dart';
import 'package:motrive/features/maintenance/data/models/service_info/service_info_model.dart';
import 'package:motrive/features/maintenance/data/models/vehicle/vehicle_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseMaintenanceAlertRemoteDataSource {
  Future<MaintenanceModel?> getMaintenanceAlert();
}

@LazySingleton(as: BaseMaintenanceAlertRemoteDataSource)
class MaintenanceAlertRemoteDataSource
    implements BaseMaintenanceAlertRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;
  final LocalNotificationService _localNotificationService;

  MaintenanceAlertRemoteDataSource(
    this._supabase,
    this._userService,
    this._localNotificationService,
  );

  @override
  Future<MaintenanceModel?> getMaintenanceAlert() async {
    final carInfo = await _supabase
        .from('vehicles')
        .select()
        .eq('user_id', _userService.currentUser!.id);
    final maintenanceLogs = await _supabase
        .from('maintenance_logs')
        .select()
        .eq('vehicle_id', carInfo.first['id']);
    final maintenance = await _supabase
        .from('services_info')
        .select()
        .eq('car_id', carInfo.first['car_info_id'])
        .order('service_odometer')
        .then(
          (value) => value
              .takeWhile(
                (maintenance) => maintenanceLogs.any(
                  (log) => log['service_id'] != maintenance['id'],
                ),
              )
              .toList(),
        );

    final nextMaintenance = maintenance.firstWhere(
      (element) =>
          element['service_odometer'] - carInfo.first['current_odometer'] <
          2000,
      orElse: () => {},
    );

    if (nextMaintenance.isEmpty) {
      return null;
    }

    final kRemaining =
        nextMaintenance['service_odometer'] - carInfo.first['current_odometer'];

    if (kRemaining < 0) {
      await _localNotificationService.maintenanceOverdueNotification(
        carName: carInfo.first['make'],
        serviceType: nextMaintenance['severity'],
      );
    } else {
      await _localNotificationService.maintenanceDueSoonNotification(
        kmRemaining: kRemaining,
        carName: carInfo.first['make'],
        serviceType: nextMaintenance['severity'],
      );
    }

    await _localNotificationService.scheduleMaintenanceDueSoon(
      id: 10,
      carName: carInfo.first['make'],
      serviceType: nextMaintenance['severity'],
      dueDate: DateTime.now().add(Duration(days: 14)),
    );

    return MaintenanceModel(
      vehicle: UserVehicleModel.fromJson(carInfo.first),
      services: [ServiceInfoModel.fromJson(nextMaintenance)],
    );
  }
}
