import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';
import 'package:motrive/features/maintenance_details/domain/entities/maintenance_save_info.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/sub/save_service/domain/repositories/save_service_repository_domain.dart';

@lazySingleton
class SaveServiceUseCase {
  final SaveServiceRepositoryDomain _repositoryData;

  SaveServiceUseCase(this._repositoryData);

  Future<Result<void, Failure>> getSaveService(
    ServiceInfoEntity serviceInfo,
    MaintenanceSaveInfo maintenanceSaveInfo,
    String carId,
  ) async {
    return _repositoryData.getSaveService(
      serviceInfo,
      maintenanceSaveInfo,
      carId,
    );
  }
}
