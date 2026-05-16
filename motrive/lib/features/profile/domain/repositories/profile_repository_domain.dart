import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepositoryDomain {
    Future<Result<ProfileEntity, Failure>> getProfile();
}
