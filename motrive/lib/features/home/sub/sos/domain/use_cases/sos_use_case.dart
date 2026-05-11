import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home/sub/sos/domain/entities/sos_entity.dart';
import 'package:motrive/features/home/sub/sos/domain/repositories/sos_repository_domain.dart';


@lazySingleton
class SosUseCase {
  final SosRepositoryDomain _repositoryData;

  SosUseCase(this._repositoryData);

   Future<Result<SosEntity, Failure>> getSos() async {
    return _repositoryData.getSos();
  }
}
