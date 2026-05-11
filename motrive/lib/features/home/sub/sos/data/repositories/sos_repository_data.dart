import 'package:injectable/injectable.dart';
import 'package:motrive/features/home/sub/sos/data/models/sos_model.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/features/home/sub/sos/data/datasources/sos_remote_data_source.dart';
import 'package:motrive/features/home/sub/sos/domain/entities/sos_entity.dart';
import 'package:motrive/features/home/sub/sos/domain/repositories/sos_repository_domain.dart';

@LazySingleton(as: SosRepositoryDomain)
class SosRepositoryData implements SosRepositoryDomain {
  final BaseSosRemoteDataSource remoteDataSource;

  SosRepositoryData(this.remoteDataSource);

  @override
   Future<Result<List<SosEntity>, Failure>> getSos() async {
    try {
      final response = await remoteDataSource.getSos();
      final data = response.map((e) => e.toEntity()).toList();
      return Success(data);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> sendSosEmail({required String email}) async {
    try {
      await remoteDataSource.sendSosEmail(email: email);

      return const Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> callPolice() async {
    try {
      await remoteDataSource.callPolice();

      return const Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> callAmbulance() async {
    try {
      await remoteDataSource.callAmbulance();

      return const Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
