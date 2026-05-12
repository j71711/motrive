import 'package:motrive/core/errors/failure.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class SignOutRepositoryDomain {
    Future<Result<void, Failure>> getSignOut();
}
