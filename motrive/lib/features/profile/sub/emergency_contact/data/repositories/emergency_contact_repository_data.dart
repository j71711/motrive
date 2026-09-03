import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/features/profile/sub/emergency_contact/data/datasources/emergency_contact_remote_data_source.dart';
import 'package:motrive/features/profile/sub/emergency_contact/data/models/emergency_contact_model.dart';
import 'package:motrive/features/profile/sub/emergency_contact/domain/entities/emergency_contact_entity.dart';
import 'package:motrive/features/profile/sub/emergency_contact/domain/repositories/emergency_contact_repository_domain.dart';
import 'package:multiple_result/multiple_result.dart';

@LazySingleton(as: EmergencyContactRepositoryDomain)
class EmergencyContactRepositoryData
    implements EmergencyContactRepositoryDomain {
  final BaseEmergencyContactRemoteDataSource remoteDataSource;

  EmergencyContactRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<EmergencyContactEntity>, Failure>>
  getEmergencyContact() async {
    try {
      final result = await remoteDataSource.getEmergencyContact();
      return Success(result.map((e) => e.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> addEmergencyContact({
    required String name,
    required String phoneNumber,
    required String relation,
    required bool notifyEmergency,
  }) async {
    try {
      await remoteDataSource.addEmergencyContact(
        name: name,
        phoneNumber: phoneNumber,
        relation: relation,
        notifyEmergency: notifyEmergency,
      );

      return const Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> updateEmergencyContact({
    required String id,
    required String name,
    required String phoneNumber,
    required String relation,
    required bool notifyEmergency,
  }) async {
    try {
      await remoteDataSource.updateEmergencyContact(
        id: id,
        name: name,
        phoneNumber: phoneNumber,
        relation: relation,
        notifyEmergency: notifyEmergency,
      );

      return const Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> deleteEmergencyContact({
    required String id,
  }) async {
    try {
      await remoteDataSource.deleteEmergencyContact(id: id);

      return const Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
