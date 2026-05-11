import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home/sub/sos/domain/entities/sos_entity.dart';
import 'package:motrive/features/home/sub/sos/domain/repositories/sos_repository_domain.dart';

@lazySingleton
class SosUseCase {
  final SosRepositoryDomain _repository;

  SosUseCase(this._repository);

   Future<Result<List<SosEntity>, Failure>> getSos()async {
    return _repository.getSos();
  }

  Future<Result<void, Failure>> sendSosEmail({required String email}) async {
    return _repository.sendSosEmail(email:email);
  }

  Future<Result<void, Failure>> callPolice() async {
    return _repository.callPolice();
  }

  Future<Result<void, Failure>> callAmbulance() async {
    return _repository.callAmbulance();
  }
}