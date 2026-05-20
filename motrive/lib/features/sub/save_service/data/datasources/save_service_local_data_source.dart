import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/constants/app_hive_keys.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';
import 'package:motrive/features/maintenance_details/domain/entities/maintenance_save_info.dart';

abstract class BaseSaveServiceLocalDataSource {
  Future<void> getSaveService(
    ServiceInfoEntity serviceInfo,
    MaintenanceSaveInfo maintenanceSaveInfo,
  );
}

@LazySingleton(as: BaseSaveServiceLocalDataSource)
class SaveServiceLocalDataSource implements BaseSaveServiceLocalDataSource {
  final Box _box;

  SaveServiceLocalDataSource(this._box);

  @override
  Future<void> getSaveService(
    ServiceInfoEntity serviceInfo,
    MaintenanceSaveInfo maintenanceSaveInfo,
  ) async {
    try {
      final rawCars = await _box.get(HiveBoxes.vehicles, defaultValue: []);
      final userCars = (rawCars as List).map((e) => toStringMap(e)).toList();

      final updatedCar = userCars.first;
      updatedCar['current_odometer'] = maintenanceSaveInfo.odometerAtService;

      final rawServices = await _box.get(
        HiveBoxes.servicesInfo,
        defaultValue: [],
      );
      final carServices = (rawServices as List)
          .map((e) => toStringMap(e))
          .toList();

      final updatedServices = carServices.map((e) {
        final service = Map<String, dynamic>.from(e);
        if (service['service_odometer'] == serviceInfo.serviceOdometer) {
          service['done'] = true;
        }
        return service;
      }).toList();

      await _box.put(HiveBoxes.vehicles, [updatedCar]);
      await _box.put(HiveBoxes.servicesInfo, updatedServices);
    } catch (e) {
      log(e.toString());
    }
  }

  Map<String, dynamic> toStringMap(dynamic raw) =>
      (raw as Map).map((k, v) => MapEntry(k.toString(), v));
}
