
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/features/profile/sub/sign_out/data/datasources/sign_out_remote_data_source.dart';
import 'package:motrive/features/profile/sub/sign_out/domain/repositories/sign_out_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';


@LazySingleton(as: SignOutRepositoryDomain)
class SignOutRepositoryData implements SignOutRepositoryDomain{
  final BaseSignOutRemoteDataSource remoteDataSource;


  SignOutRepositoryData(this.remoteDataSource);

@override
  Future<Result<void, Failure>> getSignOut() async {
    try {
      await remoteDataSource.getSignOut();
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
