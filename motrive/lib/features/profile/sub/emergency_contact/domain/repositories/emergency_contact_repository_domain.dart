import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/profile/sub/emergency_contact/domain/entities/emergency_contact_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class EmergencyContactRepositoryDomain {
  Future<Result<List<EmergencyContactEntity>, Failure>> getEmergencyContact();

  Future<Result<void, Failure>> addEmergencyContact({
    required String name,
    required String email,
    required String relation,
    required bool notifyEmergency,
  });

  Future<Result<void, Failure>> updateEmergencyContact({
    required String id,
    required String name,
    required String email,
    required String relation,
    required bool notifyEmergency,
  });

  Future<Result<void, Failure>> deleteEmergencyContact({
    required String id,
  });
}