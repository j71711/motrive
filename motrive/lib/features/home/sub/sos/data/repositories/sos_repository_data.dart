import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/features/home/sub/sos/data/datasources/sos_remote_data_source.dart';
import 'package:motrive/features/home/sub/sos/domain/repositories/sos_repository_domain.dart';

@LazySingleton(as: SosRepositoryDomain)
class SosRepositoryData implements SosRepositoryDomain {
  final BaseSosRemoteDataSource remoteDataSource;

  SosRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> sendSosEmail() async {
    try {
      await remoteDataSource.sendSosEmail();

      return const Success(null);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(
        FailureExceptions.getException(error),
      );
    }
  }

  @override
  Future<Result<void, Failure>> callPolice() async {
    try {
      await remoteDataSource.callPolice();

      return const Success(null);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(
        FailureExceptions.getException(error),
      );
    }
  }

  @override
  Future<Result<void, Failure>> callAmbulance() async {
    try {
      await remoteDataSource.callAmbulance();

      return const Success(null);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(
        FailureExceptions.getException(error),
      );
    }
  }
}