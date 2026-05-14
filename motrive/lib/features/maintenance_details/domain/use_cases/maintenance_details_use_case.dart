import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/maintenance_details/domain/entities/maintenance_details_entity.dart';
import 'package:motrive/features/maintenance_details/domain/repositories/maintenance_details_repository_domain.dart';

@lazySingleton
class MaintenanceDetailsUseCase {
  final MaintenanceDetailsRepositoryDomain _repositoryData;

  MaintenanceDetailsUseCase(this._repositoryData);

  Future<Result<MaintenanceDetailsEntity, Failure>> getMaintenanceDetails(
    String serviceId,
  ) async {
    return _repositoryData.getMaintenanceDetails(serviceId);
  }
}
