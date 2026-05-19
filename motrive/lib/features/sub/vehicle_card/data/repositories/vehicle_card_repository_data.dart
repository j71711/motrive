
import 'package:injectable/injectable.dart';
import 'package:motrive/features/maintenance/data/models/vehicle/vehicle_model.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';

import 'package:motrive/features/sub/vehicle_card/data/datasources/vehicle_card_remote_data_source.dart';
import 'package:motrive/features/sub/vehicle_card/domain/repositories/vehicle_card_repository_domain.dart';

@LazySingleton(as: VehicleCardRepositoryDomain)
class VehicleCardRepositoryData implements VehicleCardRepositoryDomain{
  final BaseVehicleCardRemoteDataSource remoteDataSource;


  VehicleCardRepositoryData(this.remoteDataSource);

@override
  Future<Result<UserVehicleEntity, Failure>> getVehicleCard() async {
    try {
      final response = await remoteDataSource.getVehicleCard();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
