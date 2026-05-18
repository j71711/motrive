import 'package:equatable/equatable.dart';
import 'package:motrive/features/reminders/domain/entities/reminders_entity.dart';

abstract class RemindersState extends Equatable {
  const RemindersState();

  @override
  List<Object?> get props => [];
}

class RemindersInitialState extends RemindersState {}

class RemindersSuccessState extends RemindersState {
  final List<RemindersEntity> reminders;

  const RemindersSuccessState({required this.reminders});

  @override
  List<Object?> get props => [reminders];
}

class RemindersErrorState extends RemindersState {
  final String message;
  const RemindersErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
