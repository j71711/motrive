import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
import 'package:motrive/features/maintenance_details/domain/entities/maintenance_save_info.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';

abstract class SaveServiceRepositoryDomain {
    Future<Result<void, Failure>> getSaveService(
    ServiceInfoEntity serviceInfo,
    MaintenanceSaveInfo maintenanceSaveInfo,
    UserVehicleEntity vehicle,
  );
}
