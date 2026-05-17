import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motrive/features/expenses/domain/entities/expenses_entity.dart';
part 'expenses_model.freezed.dart';
part 'expenses_model.g.dart';

@freezed
abstract class ExpensesModel with _$ExpensesModel {
  const factory ExpensesModel({
  required String id,
  required String category,
  @JsonKey(fromJson: toDouble)
   double? cost,
  @JsonKey(name: 'expense_date')
   DateTime? expenseDate,
  @JsonKey(name: 'odometer_at_expense', fromJson: toInt)
   required int odometer,
   String? notes,
    
  }) = _ExpensesModel;
  factory ExpensesModel.fromJson(Map<String, Object?> json) => _$ExpensesModelFromJson(json);
}
double toDouble(dynamic val) => (val as num?)?.toDouble() ?? 0.0;
int toInt(dynamic val) => (val as num?)?.toInt() ?? 0;

extension ExpensesModelMapper on ExpensesModel {
  ExpensesEntity toEntity() {
    return ExpensesEntity(id: id, category: category, cost: cost, expenseDate: expenseDate, odometer: odometer, notes: notes);
  }
  }
