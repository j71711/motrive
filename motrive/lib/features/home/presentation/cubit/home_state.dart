import 'package:equatable/equatable.dart';
import 'package:motrive/core/common/auth_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeSuccessState extends HomeState {
  final AuthEntity user;

  const HomeSuccessState({required this.user});

  @override
  List<Object?> get props => [user];
}

class HomeErrorState extends HomeState {
  final String message;
  const HomeErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
