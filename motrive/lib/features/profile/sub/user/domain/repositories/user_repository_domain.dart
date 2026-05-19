import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/profile/sub/user/domain/entities/user_entity.dart';

abstract class UserRepositoryDomain {
  Future<Result<UserEntity, Failure>> getUser();
  Future<Result<UserEntity, Failure>> updateUser({
    required String fullName,
    required String phone,
    required String gender,
    DateTime? dateOfBirth,
  });
}
