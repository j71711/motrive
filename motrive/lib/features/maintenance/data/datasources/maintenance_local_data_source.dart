import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/constants/app_hive_keys.dart';
import 'package:motrive/features/maintenance/data/models/maintenance/maintenance_model.dart';

abstract class BaseMaintenanceLocalDataSource {
  Future<MaintenanceModel?> getMaintenance();
  Future<void> saveMaintenance(MaintenanceModel maintenance);
}

@LazySingleton(as: BaseMaintenanceLocalDataSource)
class MaintenanceLocalDataSource implements BaseMaintenanceLocalDataSource {
  final Box _box;

  MaintenanceLocalDataSource(this._box);

  @override
  Future<MaintenanceModel?> getMaintenance() async {
    try {
      final rawCars = await _box.get(HiveBoxes.vehicles, defaultValue: []);
      if (rawCars == null) return null;
      final userCars = (rawCars as List).map((e) => toStringMap(e)).toList();

      if (userCars.isEmpty) return null;

      final rawServices = await _box.get(
        HiveBoxes.servicesInfo,
        defaultValue: [],
      );
      final carServices = (rawServices as List)
          .map((e) => toStringMap(e))
          .toList();

      return MaintenanceModel.fromJson({
        'vehicle': userCars.first,
        'services': carServices,
      });
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Map<String, dynamic> toStringMap(dynamic raw) =>
      (raw as Map).map((k, v) => MapEntry(k.toString(), v));

  @override
  Future<void> saveMaintenance(MaintenanceModel maintenance) async {
    try {
      await _box.put(HiveBoxes.vehicles, [maintenance.vehicle.toJson()]);
      await _box.put(
        HiveBoxes.servicesInfo,
        maintenance.services.map((e) => e.toJson()).toList(),
      );
    } catch (e) {
      return;
    }
  }
}
