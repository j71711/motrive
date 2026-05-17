import 'package:equatable/equatable.dart';

abstract class AddExpenseState extends Equatable {
  const AddExpenseState();
  @override
  List<Object?> get props => [];
}

class AddExpenseInitialState extends AddExpenseState {}
class AddExpenseSuccessState extends AddExpenseState {}
class AddExpensesLoadingState extends AddExpenseState{}
class AddExpenseErrorState extends AddExpenseState {
  final String message;
  const AddExpenseErrorState({required this.message});
  @override
  List<Object?> get props => [message];
} 

