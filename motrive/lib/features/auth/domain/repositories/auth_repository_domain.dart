import 'package:motrive/core/common/auth_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';


abstract class AuthRepositoryDomain {
  Future<Result<AuthEntity, Failure>> getAuth();
  Future<Result<AuthEntity, Failure>> googleSignIn();
  Future<Result<AuthEntity, Failure>> emailVerify({
    required String email,
    required String otp,
  });
  Future<Result<void, Failure>> emailSignIn({required String email, String? name});
}