import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/expenses/domain/entities/expense_stats_entity.dart';
import 'package:motrive/features/expenses/domain/use_cases/expenses_use_case.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  final ExpensesUseCase expensesUseCase;
  ExpensesCubit(this.expensesUseCase) : super(ExpensesInitialState()) {
    getExpensesMethod();
  }

  Future<void> getExpensesMethod() async {
    emit(ExpensesLoadingState());

    final result = await expensesUseCase.getExpenses();
    final statsResult = await expensesUseCase.getExpenseStats();

    result.when((expensesList) {
        statsResult.when((statsData) {
          emit(ExpensesSuccessState(expenses: expensesList, stats: statsData));
        }, (statsError) => emit(ExpensesErrorState(statsError.message)));
      }, (expensesError) => emit(ExpensesErrorState(expensesError.message))); 
  }

  Future<void> deleteExpenseMethod(String expenseId) async {
    emit(AddExpensesLoadingState());

    final result = await expensesUseCase.deleteExpense(expenseId);

    result.when(
      (success) => getExpensesMethod(), //getExpensesMethod(),
      (error) => emit(AddExpenseErrorState(error.message)),
    );
  }

  void filterByCategory(String category) {
    if (state is! ExpensesSuccessState) {
      return;
    }

    final current = state as ExpensesSuccessState;
    final filtered = category == 'All'
        ? current.expenses
        : current.expenses.where((e) => e.category == category).toList();

    double total = 0;
    double fuel = 0;
    double insurance = 0;
    double maintenance = 0;
    double oil = 0;
    double violation = 0;
    double other = 0;

    for (final item in filtered) {
      final amount = item.cost ?? 0;

      total += amount;

      switch (item.category) {
        case 'Fuel':
          fuel += amount;
          break;
        case 'Vehicle insurance':
          insurance += amount;
          break;
        case 'Maintenance':
          maintenance += amount;
          break;
        case 'Oil':
          oil += amount;
          break;
        case 'Traffic violation':
          violation += amount;
          break;
        case 'Other':
          other += amount;
          break;
      }
    }

    emit(
      ExpensesSuccessState(
        expenses: current.expenses,
        stats: ExpenseStatsEntity(
          monthlyTotal: total,
          yearlyTotal: total,
          fuelTotal: fuel,
          insuranceTotal: insurance,
          maintenanceTotal: maintenance,
          oilTotal: oil,
          violationTotal: violation,
          otherTotal: other,
        ),
        filteredExpenses: filtered,
        selectedCategory: category,
      ),
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
