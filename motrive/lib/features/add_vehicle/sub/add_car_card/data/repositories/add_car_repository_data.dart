import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/features/add_vehicle/sub/add_car_card/data/datasources/add_car_card_remote_data_source.dart';
import 'package:motrive/features/add_vehicle/sub/add_car_card/data/models/add_car_card_model.dart';
import 'package:motrive/features/add_vehicle/sub/add_car_card/data/models/car_info_model.dart';
import 'package:motrive/features/add_vehicle/sub/add_car_card/domain/entities/add_car_card_entity.dart';
import 'package:motrive/features/add_vehicle/sub/add_car_card/domain/repositories/add_car_card_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';

@LazySingleton(as: AddCarCardRepositoryDomain)
class AddCarCardRepositoryData implements AddCarCardRepositoryDomain{
  final BaseAddCarCardRemoteDataSource remoteDataSource;
  final VehicleLocalDataSource localDataSource;
  AddCarCardRepositoryData(this.remoteDataSource,this.localDataSource);
  @override
  Future<Result<void, Failure>> deleteVehicle(String id) async {
    try{
     await remoteDataSource.deleteVehicle(id);
     final vehicles = await remoteDataSource.getVehicles();
      await localDataSource.cacheVehicles(vehicles);
       return Success(null);
    }
    catch(error){
      return Error(FailureExceptions.getException(error));
    }
  }


  
  @override
  Future<Result<List<AddCarCardEntity>, Failure>> getVehicles() async {
       final cachedVehicles = localDataSource.getCachedVehicles();
      if (cachedVehicles.isNotEmpty) {
        // call method to update cache in background
        await refreshCacheInBackground();
        final entities =  cachedVehicles.map((e) => e.toEntity()).toList();
      return Success(entities);
      }
    try{
     final remoteVehicles =  await remoteDataSource.getVehicles();
     await localDataSource.cacheVehicles(remoteVehicles);
      return Success(remoteVehicles.map((e) => e.toEntity()).toList());
    }
    catch(error){
      return Error(FailureExceptions.getException(error));
    }
  }

  Future<void> refreshCacheInBackground() async {
    try {
      final remoteVehicles = await remoteDataSource.getVehicles();
      await localDataSource.cacheVehicles(remoteVehicles);
    } catch (_) {
    }
  }
  
  @override
  Future<Result<void, Failure>> addVehicle(AddCarCardEntity vehicle) async {
    try {
      await remoteDataSource.addVehicle(vehicle);
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
  
  @override
Future<Result<List<CarInfoEntity>, Failure>> getCarsInfo() async {
  try {
    final result = await remoteDataSource.getCarsInfo();

    return Success(
      result.map((e) => e.toEntity()).toList(),
    );
  } catch (e) {
    return Error(FailureExceptions.getException(e));
  }
}
}

