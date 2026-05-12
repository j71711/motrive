import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home/sub/sos/domain/repositories/sos_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class SosUseCase {
  final SosRepositoryDomain repository;

  SosUseCase(this.repository);

  Future<Result<void, Failure>> sendSosEmail() {
    return repository.sendSosEmail();
  }

  Future<Result<void, Failure>> callPolice() {
    return repository.callPolice();
  }

  Future<Result<void, Failure>> callAmbulance() {
    return repository.callAmbulance();
  }
}