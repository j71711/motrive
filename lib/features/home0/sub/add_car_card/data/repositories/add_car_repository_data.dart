import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/features/home0/sub/add_car_card/data/datasources/add_car_card_remote_data_source.dart';
import 'package:motrive/features/home0/sub/add_car_card/data/models/add_car_card_model.dart';
import 'package:motrive/features/home0/sub/add_car_card/domain/repositories/add_car_card_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';

@LazySingleton(as: AddCarCardRepositoryDomain)
class AddCarCardRepositoryData implements AddCarCardRepositoryDomain{
  final BaseAddCarCardRemoteDataSource remoteDataSource;
  AddCarCardRepositoryData(this.remoteDataSource,);
  @override
  Future<Result<void, Failure>> deleteVehicle(String id) async {
    try{
     await remoteDataSource.deleteVehicle(id);
       return Success(null);
    }
    catch(error){
      return Error(FailureExceptions.getException(error));
    }
  }
  
  @override
  Future<Result<List<VehicleModel>, Failure>> getVehicles() async {
    try{
     final carInfo =  await remoteDataSource.getVehicles();
       return Success(carInfo);
    }
    catch(error){
      return Error(FailureExceptions.getException(error));
    }
  }

}

