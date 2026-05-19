
import 'package:injectable/injectable.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/data/models/car_info_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/domain/entities/cars_info_entity.dart';

import 'package:motrive/features/add_vehicle/sub/cars_info/data/datasources/cars_info_remote_data_source.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/domain/repositories/cars_info_repository_domain.dart';

@LazySingleton(as: CarsInfoRepositoryDomain)
class CarsInfoRepositoryData implements CarsInfoRepositoryDomain{
  final BaseCarsInfoRemoteDataSource remoteDataSource;


  CarsInfoRepositoryData(this.remoteDataSource);

@override
  Future<Result<List<CarsInfoEntity>, Failure>> getCarsInfo() async {
    try {
      final response = await remoteDataSource.getCarsInfo();
      return Success(response.map((e) => e.toEntity(),).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
