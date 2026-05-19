import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/profile/sub/user/domain/entities/user_entity.dart';
import 'package:motrive/features/profile/sub/user/domain/repositories/user_repository_domain.dart';

@lazySingleton
class UserUseCase {
  final UserRepositoryDomain _repositoryData;

  UserUseCase(this._repositoryData);

  Future<Result<UserEntity, Failure>> getUser() async {
    return _repositoryData.getUser();
  }

  Future<Result<UserEntity, Failure>> updateUser({
    required String fullName,
    required String phone,
    required String gender,
    DateTime? dateOfBirth,
  }) async {
    return _repositoryData.updateUser(
      fullName: fullName,
      phone: phone,
      gender: gender,
      dateOfBirth: dateOfBirth
    );
  }
}
