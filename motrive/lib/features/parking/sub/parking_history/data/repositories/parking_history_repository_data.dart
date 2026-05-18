// parking_history_repository_data.dart

import 'package:injectable/injectable.dart';
import 'package:motrive/features/parking/data/models/parking_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/features/parking/domain/entities/parking_entity.dart';
import 'package:motrive/features/parking/sub/parking_history/data/datasources/parking_history_remote_data_source.dart';
import 'package:motrive/features/parking/sub/parking_history/domain/repositories/parking_history_repository_domain.dart';

@LazySingleton(as: ParkingHistoryRepositoryDomain)
class ParkingHistoryRepositoryData implements ParkingHistoryRepositoryDomain {
  final BaseParkingHistoryRemoteDataSource remoteDataSource;

  ParkingHistoryRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<ParkingEntity>, Failure>> getParkingHistory() async {
    try {
      final response = await remoteDataSource.getParkingHistory();

      return Success(response.map((e) => e.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
  
}
