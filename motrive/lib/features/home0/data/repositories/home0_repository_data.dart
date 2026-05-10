
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home0/domain/entities/home0_entity.dart';

import 'package:motrive/features/home0/data/datasources/home0_remote_data_source.dart';
import 'package:motrive/features/home0/data/models/home0_model.dart';
import 'package:motrive/features/home0/domain/repositories/home0_repository_domain.dart';

@LazySingleton(as: Home0RepositoryDomain)
class Home0RepositoryData implements Home0RepositoryDomain{
  final BaseHome0RemoteDataSource remoteDataSource;


  Home0RepositoryData(this.remoteDataSource);

@override
  Future<Result<Home0Entity, Failure>> getHome0() async {
    try {
      final response = await remoteDataSource.getHome0();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
