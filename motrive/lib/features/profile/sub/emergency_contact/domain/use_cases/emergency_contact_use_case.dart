 import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/profile/sub/emergency_contact/domain/entities/emergency_contact_entity.dart';
import 'package:motrive/features/profile/sub/emergency_contact/domain/repositories/emergency_contact_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class EmergencyContactUseCase {
  final EmergencyContactRepositoryDomain repository;

  EmergencyContactUseCase(this.repository);

  Future<Result<List<EmergencyContactEntity>, Failure>>
      getEmergencyContact() {
    return repository.getEmergencyContact();
  }

  Future<Result<void, Failure>> addEmergencyContact({
    required String name,
    required String phoneNumber,
    required String relation,
    required bool notifyEmergency,
  }) {
    return repository.addEmergencyContact(
      name: name,
      phoneNumber: phoneNumber,
      relation: relation,
      notifyEmergency: notifyEmergency,
    );
  }

  Future<Result<void, Failure>> updateEmergencyContact({
    required String id,
    required String name,
    required String phoneNumber,
    required String relation,
    required bool notifyEmergency,
  }) {
    return repository.updateEmergencyContact(
      id: id,
      name: name,
      phoneNumber: phoneNumber,
      relation: relation,
      notifyEmergency: notifyEmergency,
    );
  }

  Future<Result<void, Failure>> deleteEmergencyContact({
    required String id,
  }) {
    return repository.deleteEmergencyContact(id: id);
  }
}


