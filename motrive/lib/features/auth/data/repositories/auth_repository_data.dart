
import 'package:injectable/injectable.dart';
import 'package:motrive/core/common/auth_entity.dart';
import 'package:motrive/core/common/auth_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:motrive/features/auth/domain/repositories/auth_repository_domain.dart';
@LazySingleton(as: AuthRepositoryDomain)
class AuthRepositoryData implements AuthRepositoryDomain {
  final BaseAuthRemoteDataSource remoteDataSource;

  AuthRepositoryData(this.remoteDataSource);

  @override
  Future<Result<AuthEntity, Failure>> getAuth() async {
    try {
      final response = await remoteDataSource.getAuth();
      return Success(response.toEntity());
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<AuthEntity, Failure>> googleSignIn() async {
    try {
      final response = await remoteDataSource.googleSignIn();
      return Success(response.toEntity());
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> emailSignIn({
    required String email,
    String? name,
  }) async {
    try {
      await remoteDataSource.emailSignIn(email: email, name: name);
      return Success(null);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<AuthEntity, Failure>> emailVerify({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await remoteDataSource.emailVerify(
        email: email,
        otp: otp,
      );
      return Success(response.toEntity());
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
