import 'package:motrive/core/common/auth_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';

abstract class HomeRepositoryDomain {
    Future<Result<AuthEntity, Failure>> getHome();
}
