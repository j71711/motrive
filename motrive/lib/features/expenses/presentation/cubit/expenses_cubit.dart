import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/expenses/domain/entities/expense_stats_entity.dart';
import 'package:motrive/features/expenses/domain/entities/expenses_entity.dart';
import 'package:motrive/features/expenses/domain/use_cases/expenses_use_case.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_state.dart';
import 'package:multiple_result/multiple_result.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  final ExpensesUseCase _expensesUseCase;
  ExpensesCubit(this._expensesUseCase) : super(ExpensesInitialState()){
    getExpensesMethod('d4c4ffb3-7d73-415c-be14-b98e1907f9ef');
    //getExpensesMethod('vehicleId');
  }

Future<void> getExpensesMethod(String vehicleId) async {
    emit(ExpensesLoadingState());
    final results = await Future.wait([
      _expensesUseCase.getExpenses(vehicleId),
      _expensesUseCase.getExpenseStats(vehicleId),
    ]);

    final expensesResult = results[0] as Result<List<ExpensesEntity>, Failure>;
    final statsResult = results[1] as Result<ExpenseStatsEntity, Failure>;
    expensesResult.when(
      (expensesList) {
        statsResult.when(
          (statsData) {
            emit(ExpensesSuccessState(expensesList, statsData));
          },
          (statsError) => emit(ExpensesErrorState(statsError.message)),
        );
      },
      (expensesError) => emit(ExpensesErrorState(expensesError.message)),
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
