import 'package:equatable/equatable.dart';

abstract class SignOutState extends Equatable {
  const SignOutState();

  @override
  List<Object?> get props => [];
}

class SignOutInitialState extends SignOutState {}
class SignOutSuccessState extends SignOutState {}
class SignOutLoadingState extends SignOutState {}


class SignOutErrorState extends SignOutState {
  final String message;
  const SignOutErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

