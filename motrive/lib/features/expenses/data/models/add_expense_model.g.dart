// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddExpenseModel _$AddExpenseModelFromJson(Map<String, dynamic> json) =>
    _AddExpenseModel(
      id: json['id'] as String?,
      vehicleId: json['vehicle_id'] as String?,
      category: json['category'] as String,
      cost: (json['cost'] as num).toDouble(),
      odometer: (json['odometer_at_expense'] as num).toInt(),
      notes: json['notes'] as String?,
      expenseDate: json['expense_date'] == null
          ? null
          : DateTime.parse(json['expense_date'] as String),
    );

Map<String, dynamic> _$AddExpenseModelToJson(_AddExpenseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicle_id': instance.vehicleId,
      'category': instance.category,
      'cost': instance.cost,
      'odometer_at_expense': instance.odometer,
      'notes': instance.notes,
      'expense_date': instance.expenseDate?.toIso8601String(),
    };
