import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/maintenance/domain/entities/maintenance_entity.dart';
import 'package:motrive/features/maintenance/domain/repositories/maintenance_repository_domain.dart';


@lazySingleton
class MaintenanceUseCase {
  final MaintenanceRepositoryDomain _repositoryData;

  MaintenanceUseCase(this._repositoryData);

   Future<Result<MaintenanceEntity, Failure>> getMaintenance({
    required bool fromRemote,
  }) async {
    return _repositoryData.getMaintenance(fromRemote: fromRemote);
  }
}
