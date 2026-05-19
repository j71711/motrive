import 'package:motrive/features/home/sub/add_expense/domain/entities/add_expense_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_expense_model.freezed.dart';
part 'add_expense_model.g.dart';

@freezed
abstract class AddExpenseModel with _$AddExpenseModel {
  const factory AddExpenseModel({
    String? id ,
    @JsonKey(name: 'vehicle_id') required String vehicleId,
    required String category,
    required double cost,
    @JsonKey(name: 'odometer_at_expense') required int odometer,
    String? notes,
  }) = _AddExpenseModel;

  factory AddExpenseModel.fromJson(Map<String, Object?> json) =>
      _$AddExpenseModelFromJson(json);
}

extension AddExpenseModelMapper on AddExpenseModel {
  AddExpenseEntity toEntity() {
    return AddExpenseEntity(
      vehicleId: vehicleId,
      category: category,
      cost: cost,
      odometer: odometer,
      notes: notes, 
      id: id,
    );
  }
}

extension AddExpenseEntityMapper on AddExpenseEntity {
  AddExpenseModel toModel() {
    return AddExpenseModel(
      id: id,
      vehicleId: vehicleId!,
      category: category,
      cost: cost,
      odometer: odometer,
      notes: notes,
    );
  }
}
