import 'package:equatable/equatable.dart';

abstract class SosState extends Equatable {
  const SosState();

  @override
  List<Object?> get props => [];
}

class SosInitialState extends SosState {}

class SosLoadingState extends SosState {}

class SosSendEmailSuccessState extends SosState {}

class SosErrorState extends SosState {
  final String message;

  const SosErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}