// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddReminderModel _$AddReminderModelFromJson(Map<String, dynamic> json) =>
    _AddReminderModel(
      title: json['title'] as String,
      category: json['category'] as String,
      triggerType: json['trigger_type'] as String,
      notes: json['notes'] as String?,
      triggerDate: json['trigger_date'] == null
          ? null
          : DateTime.parse(json['trigger_date'] as String),
      triggerOdometer: (json['trigger_odometer'] as num?)?.toInt(),
      odometerAdvanceKm: (json['odometer_advance_km'] as num?)?.toInt(),
      dateAdvanceDays: (json['date_advance_days'] as num?)?.toInt(),
      isRecurring: json['is_recurring'] as bool,
      recurrenceUnit: json['recurrence_unit'] as String?,
      recurrenceValue: (json['recurrence_value'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddReminderModelToJson(_AddReminderModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'category': instance.category,
      'trigger_type': instance.triggerType,
      'notes': instance.notes,
      'trigger_date': instance.triggerDate?.toIso8601String(),
      'trigger_odometer': instance.triggerOdometer,
      'odometer_advance_km': instance.odometerAdvanceKm,
      'date_advance_days': instance.dateAdvanceDays,
      'is_recurring': instance.isRecurring,
      'recurrence_unit': instance.recurrenceUnit,
      'recurrence_value': instance.recurrenceValue,
    };
