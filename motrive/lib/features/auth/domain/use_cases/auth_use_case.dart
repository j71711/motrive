import 'package:motrive/core/common/auth_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/auth/domain/repositories/auth_repository_domain.dart';

@lazySingleton
class AuthUseCase {
  final AuthRepositoryDomain _repositoryData;

  AuthUseCase(this._repositoryData);

  Future<Result<AuthEntity, Failure>> getAuth() async {
    return _repositoryData.getAuth();
  }

  Future<Result<AuthEntity, Failure>> googleSignIn() async {
    return _repositoryData.googleSignIn();
  }

  Future<Result<AuthEntity, Failure>> emailVerify({
    required String email,
    required String otp,
  }) async {
    return _repositoryData.emailVerify(email: email, otp: otp);
  }

  Future<Result<void, Failure>> emailSignIn({
    required String email,
    String? name,
  }) async {
    return _repositoryData.emailSignIn(email: email, name: name);
  }
}
