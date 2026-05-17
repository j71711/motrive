
import 'package:injectable/injectable.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/add_vehicle/data/datasources/add_vehicle_remote_data_source.dart';
import 'package:motrive/features/add_vehicle/domain/repositories/add_vehicle_repository_domain.dart';

@LazySingleton(as: AddVehicleRepositoryDomain)
class AddVehicleRepositoryData implements AddVehicleRepositoryDomain{
  final BaseAddVehicleRemoteDataSource remoteDataSource;


  AddVehicleRepositoryData(this.remoteDataSource);

@override
  Future<Result<void, Failure>> getAddVehicle(UserVehicleEntity vehicle) async {
    try {
      await remoteDataSource.getAddVehicle(vehicle);
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
