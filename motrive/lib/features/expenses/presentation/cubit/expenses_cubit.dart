import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/expenses/domain/use_cases/expenses_use_case.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  final ExpensesUseCase _expensesUseCase;

  ExpensesCubit(this._expensesUseCase) : super(ExpensesInitialState());

  Future<void> getExpensesMethod() async {
    final result = await _expensesUseCase.getExpenses();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
