import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/domain/entities/cars_info_entity.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/domain/repositories/cars_info_repository_domain.dart';


@lazySingleton
class CarsInfoUseCase {
  final CarsInfoRepositoryDomain _repositoryData;

  CarsInfoUseCase(this._repositoryData);

   Future<Result<List<CarsInfoEntity>, Failure>> getCarsInfo() async {
    return _repositoryData.getCarsInfo();
  }
}
