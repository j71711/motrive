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
   final List<ExpensesEntity> filteredExpenses;
   final String selectedCategory; 
    
  const ExpensesSuccessState({
    required this.expenses,
    required this.stats,
    List<ExpensesEntity>? filteredExpenses,
    this.selectedCategory = 'All',
  }) : filteredExpenses = filteredExpenses ?? expenses; 
  

  @override
  List<Object?> get props => [expenses, stats, filteredExpenses, selectedCategory];
}
class ExpensesLoadingState extends ExpensesState{}
class ExpensesErrorState extends ExpensesState {
  final String message;
  const ExpensesErrorState(this.message);
  @override
  List<Object?> get props => [message];
}
class AddExpensesLoadingState extends ExpensesState{}
class AddExpenseSuccessState extends ExpensesState{}
class AddExpenseErrorState extends ExpensesState{
  final String message;
 const AddExpenseErrorState(this.message);
  @override
  List<Object?> get props => [message];
}


