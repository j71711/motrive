import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/local_notification_service.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/maintenance/data/models/maintenance/maintenance_model.dart';
import 'package:motrive/features/maintenance/data/models/service_info/service_info_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseMaintenanceAlertRemoteDataSource {
  Stream<MaintenanceModel> getMaintenanceAlert();
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
  Stream<MaintenanceModel> getMaintenanceAlert() {
    return _supabase
        .from('vehicles')
        .stream(primaryKey: ['id'])
        .eq('id', _userService.currentVehicle!.id)
        .asyncMap((event) async {
          final carInfo = _userService.currentVehicle;
          final maintenanceLogs = await _supabase
              .from('maintenance_logs')
              .select()
              .eq('vehicle_id', carInfo!.id);
          final maintenance = await _supabase
              .from('services_info')
              .select()
              .eq('car_id', carInfo.carInfoId ?? '')
              .order('service_odometer');

          final doneMaintenance = maintenance
              .takeWhile(
                (maintenance) => maintenanceLogs.any(
                  (log) => log['service_id'] != maintenance['id'],
                ),
              )
              .toList();

          final nextMaintenance = doneMaintenance.isEmpty
              ? maintenance.last
              : doneMaintenance.firstWhere(
                  (element) =>
                      element['service_odometer'] - carInfo.currentOdometer <
                      2000,
                  orElse: () => {},
                );

          if (nextMaintenance.isEmpty) {
            return throw Exception('No Car Found');
          }

          final kRemaining =
              nextMaintenance['service_odometer'] - carInfo.currentOdometer;

          if (kRemaining < 0) {
            await _localNotificationService.maintenanceOverdueNotification(
              carName: carInfo.make,
              serviceType: nextMaintenance['severity'],
            );
          } else {
            await _localNotificationService.maintenanceDueSoonNotification(
              kmRemaining: kRemaining,
              carName: carInfo.make,
              serviceType: nextMaintenance['severity'],
            );
          }
          final pendingNotification = await _localNotificationService
              .getPendingNotifications();
          if (!pendingNotification.any((element) => element.id == 10)) {
            await _localNotificationService.scheduleMaintenanceDueSoon(
              id: 10,
              carName: carInfo.make,
              serviceType: nextMaintenance['severity'],
              dueDate: DateTime.now().add(Duration(minutes: 14)),
            );
          }

          return MaintenanceModel(
            vehicle: carInfo,
            services: [ServiceInfoModel.fromJson(nextMaintenance)],
          );
        });
  }
}
