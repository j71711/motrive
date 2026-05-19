import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/reminders/domain/use_cases/reminders_use_case.dart';
import 'package:motrive/features/reminders/presentation/cubit/reminders_state.dart';

class RemindersCubit extends Cubit<RemindersState> {
  final RemindersUseCase _remindersUseCase;

  RemindersCubit(this._remindersUseCase) : super(RemindersInitialState()) {
    getRemindersMethod();
  }

  Future<void> getRemindersMethod() async {
    emit(RemindersInitialState());
    final result = await _remindersUseCase.getReminders();
    result.when(
      (success) {
        emit(RemindersSuccessState(reminders: success));
      },
      (whenError) {
        emit(RemindersErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
