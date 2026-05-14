import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/parking/domain/entities/parking_entity.dart';
import 'package:motrive/features/parking/domain/repositories/parking_repository_domain.dart';


@lazySingleton
class ParkingUseCase {
  final ParkingRepositoryDomain _repositoryData;

  ParkingUseCase(this._repositoryData);

   Future<Result<ParkingEntity, Failure>> getParking() async {
    return _repositoryData.getParking();
  }

  Future<Result<void, Failure>> saveParkingLocation() {
    return _repositoryData.saveParkingLocation();
  }

  Future<Result<void, Failure>> startAutoParking() {
    return _repositoryData.startAutoParking();
  }

  Future<Result<void, Failure>> manualSaveParking() {
    return _repositoryData.manualSaveParking();
  }
}