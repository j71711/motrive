import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/core/constants/app_enums.dart';
import 'package:motrive/features/sub/add_reminder/domain/entities/add_reminder_entity.dart';
import 'package:motrive/features/sub/add_reminder/domain/use_cases/add_reminder_use_case.dart';
import 'package:motrive/features/sub/add_reminder/presentation/cubit/add_reminder_state.dart';

class AddReminderCubit extends Cubit<AddReminderState> {
  final AddReminderUseCase _addReminderUseCase;

  AddReminderCubit(this._addReminderUseCase)
    : super(
        AddReminderInitialState(
          category: true,
          repeat: false,
          unit: .day,
          kmOrDate: true,
        ),
      );

  Future<void> getAddReminderMethod(AddReminderEntity newReminder) async {
    emit(AddReminderLoadingState());
    final result = await _addReminderUseCase.getAddReminder(newReminder);
    result.when(
      (success) {
        emit(AddReminderSuccessState());
      },
      (whenError) {
        emit(AddReminderErrorState(message: whenError.message));
      },
    );
  }

  Future<void> deleteReminder(String reminderId) async {
    emit(AddReminderLoadingState());
    final result = await _addReminderUseCase.deleteReminder(reminderId);
    result.when(
      (success) {
        emit(AddReminderSuccessState());
      },
      (whenError) {
        emit(AddReminderErrorState(message: whenError.message));
      },
    );
  }

  void toggle(
    AddReminderInitialState currentState, {
    bool? category,
    bool? repeat,
    ReminderUnit? unit,
    bool? kmOrDate,
  }) {
    emit(
      currentState.copyWith(
        category: category,
        repeat: repeat,
        unit: unit,
        kmOrDate: kmOrDate,
      ),
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
