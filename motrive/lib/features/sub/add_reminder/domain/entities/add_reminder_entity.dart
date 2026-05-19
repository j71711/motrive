import 'package:equatable/equatable.dart';

class AddReminderEntity extends Equatable {
  final String title;
  final String category;
  final String triggerType;
  final String? notes;
  final DateTime? triggerDate;
  final int? triggerOdometer;
  final int? odometerAdvanceKm;
  final int? dateAdvanceDays;
  final bool isRecurring;
  final String? recurrenceUnit;
  final int? recurrenceValue;

  const AddReminderEntity({
    required this.title,
    required this.category,
    required this.triggerType,
    this.triggerDate,
    this.triggerOdometer,
    this.odometerAdvanceKm,
    this.dateAdvanceDays,
    required this.isRecurring,
    this.recurrenceUnit,
    this.recurrenceValue, this.notes,
  });

  @override
  List<Object?> get props => [
    title,
    category,
    triggerType,
    triggerDate,
    triggerOdometer,
    odometerAdvanceKm,
    dateAdvanceDays,
    isRecurring,
    recurrenceUnit,
    recurrenceValue,
    notes
  ];
}
