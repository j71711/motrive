import 'package:equatable/equatable.dart';

abstract class ExpensesState extends Equatable {
  const ExpensesState();

  @override
  List<Object?> get props => [];
}

class ExpensesInitialState extends ExpensesState {}
class ExpensesSuccessState extends ExpensesState {}

class ExpensesErrorState extends ExpensesState {
  final String message;
  const ExpensesErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

