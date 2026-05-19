import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/sub/vehicle_card/domain/repositories/vehicle_card_repository_domain.dart';


@lazySingleton
class VehicleCardUseCase {
  final VehicleCardRepositoryDomain _repositoryData;

  VehicleCardUseCase(this._repositoryData);

   Future<Result<UserVehicleEntity, Failure>> getVehicleCard() async {
    return _repositoryData.getVehicleCard();
  }
}
