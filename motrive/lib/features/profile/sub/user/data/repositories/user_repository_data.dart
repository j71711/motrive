import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/features/profile/sub/user/data/datasources/user_remote_data_source.dart';
import 'package:motrive/features/profile/sub/user/data/models/user_model.dart' show UserModelMapper;
import 'package:motrive/features/profile/sub/user/domain/entities/user_entity.dart';
import 'package:motrive/features/profile/sub/user/domain/repositories/user_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';

@LazySingleton(as: UserRepositoryDomain)
class UserRepositoryData implements UserRepositoryDomain {
  final BaseUserRemoteDataSource remoteDataSource;

  UserRepositoryData(this.remoteDataSource);

  @override
  Future<Result<UserEntity, Failure>> getUser() async {
    try {
      final response = await remoteDataSource.getUser();

      return Success(response.toEntity());
    } catch (error) {
      return Error(
        FailureExceptions.getException(error),
      );
    }
  }

  @override
  Future<Result<UserEntity, Failure>> updateUser({
    required String fullName,
    required String phone,
    required String gender,
    DateTime? dateOfBirth,
  }) async {
    try {
      final response = await remoteDataSource.updateUser(
        fullName: fullName,
        phone: phone,
        gender: gender,
        dateOfBirth: dateOfBirth,
      );

      return Success(response.toEntity());
    } catch (error) {
      return Error(
        FailureExceptions.getException(error),
      );
    }
  }
}