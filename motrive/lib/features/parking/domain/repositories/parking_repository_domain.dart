import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/parking/domain/entities/parking_entity.dart';

abstract class ParkingRepositoryDomain {
  Future<Result<ParkingEntity, Failure>> getParking();

  Future<Result<void, Failure>> saveParkingLocation();

  Future<Result<void, Failure>> startAutoParking();

  Future<Result<void, Failure>> manualSaveParking();
}
