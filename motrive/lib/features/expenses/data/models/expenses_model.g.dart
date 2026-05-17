// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpensesModel _$ExpensesModelFromJson(Map<String, dynamic> json) =>
    _ExpensesModel(
      id: json['id'] as String,
      category: json['category'] as String,
      cost: toDouble(json['cost']),
      expenseDate: json['expense_date'] == null
          ? null
          : DateTime.parse(json['expense_date'] as String),
      odometer: toInt(json['odometer_at_expense']),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$ExpensesModelToJson(_ExpensesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'cost': instance.cost,
      'expense_date': instance.expenseDate?.toIso8601String(),
      'odometer_at_expense': instance.odometer,
      'notes': instance.notes,
    };
