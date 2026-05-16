import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/profile/sub/sign_out/domain/repositories/sign_out_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignOutUseCase {
  final SignOutRepositoryDomain _repositoryData;

  SignOutUseCase(this._repositoryData);

   Future<Result<void, Failure>> getSignOut() async {
    return _repositoryData.getSignOut();
  }
}
