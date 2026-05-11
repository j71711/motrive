
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home/sub/sos/domain/entities/sos_entity.dart';

import 'package:motrive/features/home/sub/sos/data/datasources/sos_remote_data_source.dart';
import 'package:motrive/features/home/sub/sos/data/models/sos_model.dart';
import 'package:motrive/features/home/sub/sos/domain/repositories/sos_repository_domain.dart';

@LazySingleton(as: SosRepositoryDomain)
class SosRepositoryData implements SosRepositoryDomain{
  final BaseSosRemoteDataSource remoteDataSource;


  SosRepositoryData(this.remoteDataSource);

@override
  Future<Result<SosEntity, Failure>> getSos() async {
    try {
      final response = await remoteDataSource.getSos();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
