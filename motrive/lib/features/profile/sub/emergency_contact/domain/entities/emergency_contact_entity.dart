import 'package:equatable/equatable.dart';

class EmergencyContactEntity extends Equatable {
  final String id;
  final String userId;
  final String name;
  final String email;
  final String relation;
  final bool notifyEmergency;
  final DateTime? createdAt;

  const EmergencyContactEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.relation,
    required this.notifyEmergency,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        email,
        relation,
        notifyEmergency,
        createdAt,
      ];
}