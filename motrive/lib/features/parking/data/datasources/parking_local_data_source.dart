import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/constants/app_hive_keys.dart';
import 'package:motrive/features/parking/data/models/parking_model.dart';

abstract class BaseParkingLocalDataSource {
  Future<ParkingModel?> getParking();

  Future<void> saveParking(ParkingModel parking);
}

@LazySingleton(as: BaseParkingLocalDataSource)
class ParkingLocalDataSource
    implements BaseParkingLocalDataSource {
  final Box _box;

  ParkingLocalDataSource(this._box);

  @override
  Future<ParkingModel?> getParking() async {
    try {
      final rawParking = await _box.get(
        HiveBoxes.parking,
      );

      if (rawParking == null) {
        return null;
      }

      final parkingMap = toStringMap(rawParking);

      return ParkingModel.fromJson(parkingMap);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Map<String, dynamic> toStringMap(dynamic raw) =>
      (raw as Map).map(
        (k, v) => MapEntry(k.toString(), v),
      );

  @override
  Future<void> saveParking(
    ParkingModel parking,
  ) async {
    try {
      await _box.put(
        HiveBoxes.parking,
        parking.toJson(),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}