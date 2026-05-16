import 'package:motrive/features/maintenance/domain/entities/maintenance_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';

abstract class MaintenanceAlertRepositoryDomain {
    Future<Result<MaintenanceEntity?, Failure>> getMaintenanceAlert();
}
