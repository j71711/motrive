import 'package:motrive/features/parking/domain/entities/parking_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/parking/sub/parking_history/domain/repositories/parking_history_repository_domain.dart';

@lazySingleton
class ParkingHistoryUseCase {
  final ParkingHistoryRepositoryDomain _repository;

  ParkingHistoryUseCase(this._repository);

  Future<Result<List<ParkingEntity>, Failure>> getParkingHistory() {
    return _repository.getParkingHistory();
  }
}
