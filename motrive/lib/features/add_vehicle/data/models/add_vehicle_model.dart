import 'package:motrive/features/add_vehicle/domain/entities/add_vehicle_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_vehicle_model.freezed.dart';
part 'add_vehicle_model.g.dart';

@freezed
abstract class AddVehicleModel with _$AddVehicleModel {
  const factory AddVehicleModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _AddVehicleModel;

  factory AddVehicleModel.fromJson(Map<String, Object?> json) => _$AddVehicleModelFromJson(json);
}



extension AddVehicleModelMapper on AddVehicleModel {
  AddVehicleEntity toEntity() {
    return AddVehicleEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
