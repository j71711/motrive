import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home/sub/sos/domain/entities/sos_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class SosRepositoryDomain {
   Future<Result<List<SosEntity>, Failure>> getSos();

 Future<Result<void, Failure>> sendSosEmail({required String email}) ;

  Future<Result<void, Failure>> callPolice();

  Future<Result<void, Failure>> callAmbulance();
}