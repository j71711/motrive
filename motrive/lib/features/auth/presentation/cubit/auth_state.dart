import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  final bool? isLogin;
  const AuthState({this.isLogin});

  @override
  List<Object?> get props => [isLogin];
}

class AuthInitialState extends AuthState {
  const AuthInitialState({super.isLogin});
}

class AuthGoogleSuccessState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthEmailSuccessState extends AuthState {
  final String email;
  final String name;

  const AuthEmailSuccessState({required this.email, required this.name});

  @override
  List<Object?> get props => [email, name];
}

class AuthErrorState extends AuthState {
  final String message;
  const AuthErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
