import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {}
class ProfileSuccessState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String message;
  const ProfileErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

