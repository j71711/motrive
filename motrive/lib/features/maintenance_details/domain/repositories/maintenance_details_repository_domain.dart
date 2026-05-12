import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/maintenance_details/domain/entities/maintenance_details_entity.dart';

abstract class MaintenanceDetailsRepositoryDomain {
    Future<Result<MaintenanceDetailsEntity, Failure>> getMaintenanceDetails();
}
