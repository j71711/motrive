import 'dart:async';
import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/features/parking/data/datasources/parking_remote_data_source.dart';

@lazySingleton
class ParkingService {
  final BaseParkingRemoteDataSource remoteDataSource;

  ParkingService(this.remoteDataSource);

  ActivityType? lastActivity;

  bool alreadySaved = false;

  StreamSubscription<ActivityEvent>? subscription;

  void startTracking() {
    subscription = ActivityRecognition()
        .activityStream()
        .listen((activityData) async {
      print(activityData.type);

      if (lastActivity == ActivityType.inVehicle &&
          activityData.type == ActivityType.still &&
          alreadySaved == false) {
        alreadySaved = true;

        await Future.delayed(
          const Duration(minutes: 2),
        );

        await remoteDataSource.saveParkingLocation();
      }

      if (activityData.type == ActivityType.inVehicle) {
        alreadySaved = false;
      }

      lastActivity = activityData.type;
    });
  }
  Future<void> manualSaveParking() async {
    await remoteDataSource.saveParkingLocation();
  }

  void dispose() {
    subscription?.cancel();
  }
}