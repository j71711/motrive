import 'package:equatable/equatable.dart';
import 'package:motrive/features/expenses/domain/entities/expense_stats_entity.dart';
import 'package:motrive/features/expenses/domain/entities/expenses_entity.dart';

abstract class ExpensesState extends Equatable {
  const ExpensesState();

  @override
  List<Object?> get props => [];
}

class ExpensesInitialState extends ExpensesState {}
class ExpensesSuccessState extends ExpensesState {
  final List<ExpensesEntity> expenses;
  final ExpenseStatsEntity stats;
  const ExpensesSuccessState(this.expenses, this.stats);
  @override
  List<Object?> get props => [expenses, stats];
}

class ExpensesLoadingState extends ExpensesState{}
class ExpensesErrorState extends ExpensesState {
  final String message;
  const ExpensesErrorState(this.message);
  @override
  List<Object?> get props => [message];
}

