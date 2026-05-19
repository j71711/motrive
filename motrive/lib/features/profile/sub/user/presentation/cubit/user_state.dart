import 'package:equatable/equatable.dart';
import 'package:motrive/features/profile/sub/user/domain/entities/user_entity.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {
  final UserEntity user;

  const UserSuccessState({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}


class UserErrorState extends UserState {
  final String message;

  const UserErrorState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}