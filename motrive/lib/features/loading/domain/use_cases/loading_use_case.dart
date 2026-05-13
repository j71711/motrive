import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/loading/domain/entities/loading_entity.dart';
import 'package:motrive/features/loading/domain/repositories/loading_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class LoadingUseCase {
  final LoadingRepositoryDomain _repositoryData;

  LoadingUseCase(this._repositoryData);

  Future<Result<LoadingEntity, Failure>> getLoading() async {
    return _repositoryData.loginStatus();
  }
}
