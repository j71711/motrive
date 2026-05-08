import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home0/domain/entities/home0_entity.dart';
import 'package:motrive/features/home0/domain/repositories/home0_repository_domain.dart';


@lazySingleton
class Home0UseCase {
  final Home0RepositoryDomain _repositoryData;

  Home0UseCase(this._repositoryData);

   Future<Result<Home0Entity, Failure>> getHome0() async {
    return _repositoryData.getHome0();
  }
}
