import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String? email;
  final String? phone;
  final String? fullName;
  final String? gender;
  final DateTime? dateOfBirth;

 

  const UserEntity({
    required this.id,
    this.email,
    this.phone,
    this.fullName,
    this.gender,
    this.dateOfBirth,
 
 
  });

  @override
  List<Object?> get props => [
        id,
        email,
        phone,
        fullName,
        gender,
        dateOfBirth,
       
      ];
}