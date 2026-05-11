import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/services/emergency_service.dart';

abstract class BaseSosRemoteDataSource {
  Future<void> sendSosEmail();

  Future<void> callPolice();

  Future<void> callAmbulance();
}

@LazySingleton(as: BaseSosRemoteDataSource)
class SosRemoteDataSource
    implements BaseSosRemoteDataSource {
  final EmergencyService emergencyService;

  SosRemoteDataSource(this.emergencyService);

  @override
  Future<void> sendSosEmail() async {
    try {
      await emergencyService.sendSosEmail();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> callPolice() async {
    try {
      await emergencyService.callPolice();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> callAmbulance() async {
    try {
      await emergencyService.callAmbulance();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}