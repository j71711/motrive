import 'package:equatable/equatable.dart';
import 'package:motrive/features/sub/add_reminder/domain/entities/add_reminder_entity.dart';

class RemindersEntity extends Equatable {
  final String id;
  final String userId;
  final String vehicleId;
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
  final bool isActive;
  final bool isDismissed;
  final DateTime? dismissedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const RemindersEntity({
    required this.id,
    required this.userId,
    required this.vehicleId,
    required this.title,
    required this.category,
    required this.triggerType,
    this.triggerDate,
    this.triggerOdometer,
    this.odometerAdvanceKm,
    this.dateAdvanceDays,
    required this.isRecurring,
    this.recurrenceUnit,
    this.recurrenceValue,
    required this.isActive,
    required this.isDismissed,
    this.dismissedAt,
    this.createdAt,
    this.updatedAt,
    this.notes,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    vehicleId,
    title,
    category,
    notes,
    triggerType,
    triggerDate,
    triggerOdometer,
    odometerAdvanceKm,
    dateAdvanceDays,
    isRecurring,
    recurrenceUnit,
    recurrenceValue,
    isActive,
    isDismissed,
    dismissedAt,
    createdAt,
    updatedAt,
  ];

  static bool _eq(dynamic a, dynamic b) => a == null || b == null || a == b;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    // ── Compare against AddReminderEntity (shared fields only) ────
    if (other is AddReminderEntity) {
      return _eq(title,             other.title)
          && _eq(category,          other.category)
          && _eq(triggerType,       other.triggerType)
          && _eq(notes,             other.notes)
          && _eq(triggerDate,       other.triggerDate)
          && _eq(triggerOdometer,   other.triggerOdometer)
          && _eq(odometerAdvanceKm, other.odometerAdvanceKm)
          && _eq(dateAdvanceDays,   other.dateAdvanceDays)
          && _eq(isRecurring,       other.isRecurring)
          && _eq(recurrenceUnit,    other.recurrenceUnit)
          && _eq(recurrenceValue,   other.recurrenceValue);
    }

    return false;
  }
  
 @override
  int get hashCode => Object.hashAll([
    id, userId, vehicleId, title, category,
    triggerType, notes, triggerDate, triggerOdometer,
    odometerAdvanceKm, dateAdvanceDays, isRecurring,
    recurrenceUnit, recurrenceValue, isActive,
    isDismissed, dismissedAt, createdAt, updatedAt,
  ]);
  
}
