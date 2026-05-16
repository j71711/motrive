import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/constants/app_hive_keys.dart';
import 'package:motrive/core/services/local_notification_service.dart';
import 'package:motrive/features/maintenance/data/models/maintenance/maintenance_model.dart';
import 'package:motrive/features/maintenance/data/models/service_info/service_info_model.dart';
import 'package:motrive/features/maintenance/data/models/vehicle/vehicle_model.dart';

abstract class BaseMaintenanceAlertLocalDataSource {
  Future<MaintenanceModel?> getMaintenanceAlert();
}

@LazySingleton(as: BaseMaintenanceAlertLocalDataSource)
class MaintenanceAlertLocalDataSource
    implements BaseMaintenanceAlertLocalDataSource {
  final LocalNotificationService _localNotificationService;
  final Box _box;

  MaintenanceAlertLocalDataSource(this._localNotificationService, this._box);

  @override
  Future<MaintenanceModel?> getMaintenanceAlert() async {
    try {
      final rawCars = await _box.get(HiveBoxes.vehicles, defaultValue: []);
      final userCars = (rawCars as List).map((e) => toStringMap(e)).toList();

      if (userCars.isEmpty) return null;

      final rawServices = await _box.get(
        HiveBoxes.servicesInfo,
        defaultValue: [],
      );
      final carServices = (rawServices as List)
          .map((e) => toStringMap(e))
          .toList();

      final nextMaintenance = carServices.lastWhere(
        (element) =>
            element['service_odometer'] - userCars.first['current_odometer'] <
            2000,
        orElse: () => {},
      );

      if (nextMaintenance.isEmpty) {
        return null;
      }

      final kRemaining =
          nextMaintenance['service_odometer'] -
          userCars.first['current_odometer'];

      if (kRemaining < 0) {
        await _localNotificationService.maintenanceOverdueNotification(
          carName: userCars.first['make'],
          serviceType: nextMaintenance['severity'],
        );
      } else if (kRemaining < 1000) {
        await _localNotificationService.maintenanceDueSoonNotification(
          kmRemaining: kRemaining,
          carName: userCars.first['make'],
          serviceType: nextMaintenance['severity'],
        );
      }

      await _localNotificationService.scheduleMaintenanceDueSoon(
        id: 10,
        carName: userCars.first['make'],
        serviceType: nextMaintenance['severity'],
        dueDate: DateTime.now().add(Duration(days: 14)),
      );

      return MaintenanceModel(
        vehicle: UserVehicleModel.fromJson(userCars.first),
        services: [ServiceInfoModel.fromJson(nextMaintenance)],
      );
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Map<String, dynamic> toStringMap(dynamic raw) =>
      (raw as Map).map((k, v) => MapEntry(k.toString(), v));
}
