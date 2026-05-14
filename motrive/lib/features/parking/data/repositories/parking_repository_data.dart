
import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/parking_service.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/parking/domain/entities/parking_entity.dart';

import 'package:motrive/features/parking/data/datasources/parking_remote_data_source.dart';
import 'package:motrive/features/parking/data/models/parking_model.dart';
import 'package:motrive/features/parking/domain/repositories/parking_repository_domain.dart';

@LazySingleton(as: ParkingRepositoryDomain)
class ParkingRepositoryData implements ParkingRepositoryDomain{
  final BaseParkingRemoteDataSource remoteDataSource;

final ParkingService parkingService;


  ParkingRepositoryData(
    this.remoteDataSource,
    this.parkingService,
  );

  @override
  Future<Result<ParkingEntity, Failure>>
  getParking() async {
    try {
      final response =
          await remoteDataSource.getParking();

      return Success(response.toEntity());
    } catch (error) {
      return Error(
        FailureExceptions.getException(error),
      );
    }
  }

  @override
  Future<Result<void, Failure>>
  saveParkingLocation() async {
    try {
      await remoteDataSource
          .saveParkingLocation();

      return const Success(null);
    } catch (error) {
      return Error(
        FailureExceptions.getException(error),
      );
    }
  }

  @override
  Future<Result<void, Failure>>
  startAutoParking() async {
    try {
      parkingService.startTracking();

      return const Success(null);
    } catch (error) {
      return Error(
        FailureExceptions.getException(error),
      );
    }
  }

   @override
  Future<Result<void, Failure>> manualSaveParking() async {
    try {
      await parkingService.manualSaveParking();

      return const Success(null);
    } catch (error) {
      return Error(
        FailureExceptions.getException(error),
      );
    }
  }
}