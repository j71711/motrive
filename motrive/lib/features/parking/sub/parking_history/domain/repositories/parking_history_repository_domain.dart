// parking_history_repository_domain.dart

import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/parking/domain/entities/parking_entity.dart';

abstract class ParkingHistoryRepositoryDomain {
  Future<Result<List<ParkingEntity>, Failure>> getParkingHistory();
}
