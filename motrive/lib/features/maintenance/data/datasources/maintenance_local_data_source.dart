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
    log('--------------1');

    // ── Helper: deep-convert _Map<dynamic,dynamic> → Map<String,dynamic> ──
    Map<String, dynamic> toStringMap(dynamic raw) =>
        (raw as Map).map((k, v) => MapEntry(k.toString(), v));

    // ── Read & convert vehicles ────────────────────────────────────────────
    final rawCars = await _box.get(HiveBoxes.vehicles, defaultValue: []);
    final userCars = (rawCars as List)
        .map((e) => toStringMap(e))
        .toList();

    if (userCars.isEmpty) return null;
    log('--------------2');

    // ── Read & convert services ────────────────────────────────────────────
    final rawServices = await _box.get(HiveBoxes.servicesInfo, defaultValue: []);
    final carServices = (rawServices as List)
        .map((e) => toStringMap(e))
        .toList();

    log('--------------3');
    log(carServices.runtimeType.toString()); // List<Map<String, dynamic>>

    // ── Read & convert maintenance logs ───────────────────────────────────
    final rawLogs = await _box.get(HiveBoxes.maintenanceLogs, defaultValue: []);
    final doneServices = (rawLogs as List)
        .map((e) => toStringMap(e))
        .toList();

    log('--------------4');

    // ── Merge logs into services ───────────────────────────────────────────
    final carServicesWithLogs = carServices.map((service) {
      log('in 1');

      // Copy so we don't mutate the cached map
      final merged = Map<String, dynamic>.from(service);
      log('in 2');

      final isDone = doneServices.any(
        (done) => done[MaintenanceLogKeys.serviceId] == merged[ServiceInfoKeys.id],
      );

      if (isDone) {
        merged['done'] = true;
        log('in 3');
      }

      log('in 4');
      return merged;
    }).toList();

    log('--------------5');

    return MaintenanceModel.fromJson({
      'vehicle': userCars.first,
      'services': carServicesWithLogs,
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
