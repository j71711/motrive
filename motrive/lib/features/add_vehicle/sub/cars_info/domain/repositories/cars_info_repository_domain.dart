import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/add_vehicle/sub/cars_info/domain/entities/cars_info_entity.dart';

abstract class CarsInfoRepositoryDomain {
    Future<Result<List<CarsInfoEntity>, Failure>> getCarsInfo();
}
