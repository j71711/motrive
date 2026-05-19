import 'package:equatable/equatable.dart';
import 'package:motrive/core/constants/app_enums.dart';

abstract class AddReminderState extends Equatable {
  const AddReminderState();

  AddReminderState copyWith();

  @override
  List<Object?> get props => [];
}

class AddReminderInitialState extends AddReminderState {
  final bool category;
  final bool repeat;
  final ReminderUnit unit;
  final bool kmOrDate;

  const AddReminderInitialState({
    required this.category,
    required this.repeat,
    required this.unit, required this.kmOrDate,
  });

  @override
  AddReminderInitialState copyWith({
    bool? category,
    bool? repeat,
    ReminderUnit? unit,
    bool? kmOrDate,
  bool? dateEnabled,
  }) {
    return AddReminderInitialState(
      category: category ?? this.category,
      repeat: repeat ?? this.repeat,
      unit: unit ?? this.unit,
      kmOrDate: kmOrDate ?? this.kmOrDate
    );
  }

  @override
  List<Object?> get props => [category, repeat, unit, kmOrDate];
}

class AddReminderLoadingState extends AddReminderState {
  @override
  AddReminderLoadingState copyWith() {
    return AddReminderLoadingState();
  }
}

class AddReminderSuccessState extends AddReminderState {
  @override
  AddReminderSuccessState copyWith() {
    return AddReminderSuccessState();
  }
}

class AddReminderErrorState extends AddReminderState {
  final String message;
  const AddReminderErrorState({required this.message});
  @override
  List<Object?> get props => [message];

  @override
  AddReminderErrorState copyWith() {
    return AddReminderErrorState(message: message);
  }
}
