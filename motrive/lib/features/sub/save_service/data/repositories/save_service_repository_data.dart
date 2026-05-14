import 'package:injectable/injectable.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:motrive/features/maintenance_details/domain/entities/maintenance_save_info.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/sub/save_service/data/datasources/save_service_remote_data_source.dart';
import 'package:motrive/features/sub/save_service/domain/repositories/save_service_repository_domain.dart';

@LazySingleton(as: SaveServiceRepositoryDomain)
class SaveServiceRepositoryData implements SaveServiceRepositoryDomain {
  final BaseSaveServiceRemoteDataSource remoteDataSource;

  SaveServiceRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> getSaveService(
    ServiceInfoEntity serviceInfo,
    MaintenanceSaveInfo maintenanceSaveInfo,
    UserVehicleEntity vehicle
  ) async {
    try {
      await remoteDataSource.getSaveService(
        serviceInfo,
        maintenanceSaveInfo,
        vehicle,
      );
      return Success(null);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
