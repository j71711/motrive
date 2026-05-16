
import 'package:equatable/equatable.dart';
import 'package:motrive/features/profile/sub/emergency_contact/domain/entities/emergency_contact_entity.dart';

abstract class EmergencyContactState extends Equatable {
  const EmergencyContactState();

  @override
  List<Object?> get props => [];
}

class EmergencyContactInitialState extends EmergencyContactState {}

class EmergencyContactLoadingState extends EmergencyContactState {}

class EmergencyContactSuccessState extends EmergencyContactState {
  final List<EmergencyContactEntity> contacts;

  const EmergencyContactSuccessState(this.contacts);

  @override
  List<Object?> get props => [contacts];
}

class EmergencyContactActionSuccessState extends EmergencyContactState {}

class EmergencyContactErrorState extends EmergencyContactState {
  final String message;

  const EmergencyContactErrorState(this.message);

  @override
  List<Object?> get props => [message];
}