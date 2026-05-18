// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemindersModel _$RemindersModelFromJson(Map<String, dynamic> json) =>
    _RemindersModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      vehicleId: json['vehicle_id'] as String,
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
      isActive: json['is_active'] as bool,
      isDismissed: json['is_dismissed'] as bool,
      dismissedAt: json['dismissed_at'] == null
          ? null
          : DateTime.parse(json['dismissed_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$RemindersModelToJson(_RemindersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'vehicle_id': instance.vehicleId,
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
      'is_active': instance.isActive,
      'is_dismissed': instance.isDismissed,
      'dismissed_at': instance.dismissedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
