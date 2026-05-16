import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String id;
  final String email;
  final String? phone;
  final String? fullName;
  final String? gender;
  final String? avatarUrl;
  final DateTime? dateOfBirth;
  final String? authId;
  final String? notificationId;

  const AuthEntity({
    required this.id,
    required this.email,
    this.phone,
    this.fullName,
    this.gender,
    this.avatarUrl,
    this.dateOfBirth,
    this.authId,
    this.notificationId,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        phone,
        fullName,
        gender,
        avatarUrl,
        dateOfBirth,
        authId,
        notificationId,
      ];
}