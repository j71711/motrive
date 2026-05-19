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
  Function()? onParkingSaved;

  StreamSubscription<ActivityEvent>? subscription;

  void startTracking() {
    subscription = ActivityRecognition().activityStream().listen(
      (activityData) async {
        //! print(activityData.type);
        final wasInCar = lastActivity == ActivityType.inVehicle;
        final nowStoppedOrWalking =
            activityData.type == ActivityType.still ||
            activityData.type == ActivityType.walking ||
            activityData.type == ActivityType.onFoot;

        if (wasInCar && nowStoppedOrWalking && alreadySaved == false) {
          alreadySaved = true;

          await Future.delayed(const Duration(minutes: 2));
          await Future.delayed(const Duration(minutes: 2));

          await remoteDataSource.saveParkingLocation(
            detectionMethod: 'activity_recognition',
          );
          onParkingSaved?.call();
        }

        if (activityData.type == ActivityType.inVehicle) {
          alreadySaved = false;
        }

        lastActivity = activityData.type;
      },
      onError: (error) {
        print('Activity recognition not available: $error');
      },
    );
  }

  Future<void> manualSaveParking() async {
    await remoteDataSource.saveParkingLocation(detectionMethod: 'manual');
  }

  void dispose() {
    subscription?.cancel();
  }
}
