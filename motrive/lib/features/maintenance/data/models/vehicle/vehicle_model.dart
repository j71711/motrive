import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motrive/features/home/sub/add_car_card/domain/entities/add_car_card_entity.dart';
part 'vehicle_model.freezed.dart';
part 'vehicle_model.g.dart';

@freezed
abstract class VehicleModel with _$VehicleModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory VehicleModel({
    required String userId,
    required String id,
    required String make,
    required String model,
    required int year,
    required String? color,
    required String? licensePlate,
    required String? vin,
    required int? currentOdometer,
  }) = _VehicleModel;

  factory VehicleModel.fromJson(Map<String, Object?> json) =>
      _$VehicleModelFromJson(json);
}

extension VehicleModelMapper on VehicleModel {
  VehicleEntity toEntity() {
    return VehicleEntity(
      userId: userId,
      id: id,
      make: make,
      model: model,
      year: year,
      color: color,
      currentOdometer: currentOdometer,
      licensePlate: licensePlate,
      vin: vin
    );
  }
}