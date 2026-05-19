import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/home/sub/add_expense/domain/entities/add_expense_entity.dart';
import 'package:motrive/features/home/sub/add_expense/domain/use_cases/add_expense_use_case.dart';
import 'package:motrive/features/home/sub/add_expense/presentation/cubit/add_expense_state.dart';

class AddExpenseCubit extends Cubit<AddExpenseState> {
  final AddExpenseUseCase _addExpenseUseCase;

  AddExpenseCubit(this._addExpenseUseCase) : super(AddExpenseInitialState());

  final costController = TextEditingController();
  final kmController = TextEditingController();
  String? selectedCategory;

  Future<void> addExpenseMethod() async {
    if (costController.text.isEmpty ||
        kmController.text.isEmpty ||
        selectedCategory == null) {
      emit(const AddExpenseErrorState(message: 'Please fill in all fields'));
      return;
    }

    emit(AddExpensesLoadingState());

    final entity = AddExpenseEntity(
      vehicleId: 'vehicleId',
      category: selectedCategory!,
      cost: double.tryParse(costController.text) ?? 0.0,
      odometer: int.tryParse(kmController.text) ?? 0, 
      id: '',
    );

    final result = await _addExpenseUseCase.addExpense(entity);

    result.when((success) async {
      clearControllers();
      emit(AddExpenseSuccessState());
    }, (error) => emit(AddExpenseErrorState(message: error.message)));
  }

  void clearControllers() {
    costController.clear();
    kmController.clear();
    selectedCategory = null;
  }

  Future<void> deleteExpenseMethod(
  String expenseId,
) async {
  emit(AddExpensesLoadingState());

  final result =
      await _addExpenseUseCase.deleteExpense(
    expenseId,
  );

  result.when(
    (success) => emit(AddExpenseSuccessState()),
    (error) => emit(
      AddExpenseErrorState(
        message: error.message,
      ),
    ),
  );
}

Future<void> updateExpenseMethod(
  AddExpenseEntity entity,
) async {
  emit(AddExpensesLoadingState());

  final result =
      await _addExpenseUseCase.updateExpense(
    entity,
  );

  result.when(
    (success) => emit(AddExpenseSuccessState()),
    (error) => emit(
      AddExpenseErrorState(
        message: error.message,
      ),
    ),
  );
}

  @override
  Future<void> close() {
    costController.dispose();
    kmController.dispose();
    return super.close();
  }
}
