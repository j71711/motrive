import 'package:motrive/features/expenses/domain/entities/expenses_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'expenses_model.freezed.dart';
part 'expenses_model.g.dart';

@freezed
abstract class ExpensesModel with _$ExpensesModel {
  const factory ExpensesModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _ExpensesModel;

  factory ExpensesModel.fromJson(Map<String, Object?> json) => _$ExpensesModelFromJson(json);
}



extension ExpensesModelMapper on ExpensesModel {
  ExpensesEntity toEntity() {
    return ExpensesEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
