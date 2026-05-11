import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';

abstract class SosRepositoryDomain {
  Future<Result<void, Failure>> sendSosEmail();

  Future<Result<void, Failure>> callPolice();

  Future<Result<void, Failure>> callAmbulance();
}