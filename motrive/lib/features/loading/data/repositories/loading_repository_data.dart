import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/features/loading/data/datasources/loading_remote_data_source.dart';
import 'package:motrive/features/loading/data/models/loading_model.dart';
import 'package:motrive/features/loading/domain/entities/loading_entity.dart';
import 'package:motrive/features/loading/domain/repositories/loading_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';


@LazySingleton(as: LoadingRepositoryDomain)
class LoadingRepositoryData implements LoadingRepositoryDomain {
  final BaseLoadingRemoteDataSource remoteDataSource;

  LoadingRepositoryData(this.remoteDataSource);

  @override
  Future<Result<LoadingEntity, Failure>> loginStatus() async {
    try {
      final response = await remoteDataSource.loginStatus();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
