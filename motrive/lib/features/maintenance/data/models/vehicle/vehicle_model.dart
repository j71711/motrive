import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motrive/features/maintenance/domain/entities/vehicle_entity.dart';
part 'vehicle_model.freezed.dart';
part 'vehicle_model.g.dart';

@freezed
abstract class UserVehicleModel with _$UserVehicleModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: .snake)
  const factory UserVehicleModel({
    required String userId,
    required String id,
    required String make,
    required String model,
    required int year,
    String? color,
    String? licensePlate,
    String? vin,
    int? currentOdometer,
    int? odometerAtRegistered,
    String? carInfoId
  }) = _UserVehicleModel;

  factory UserVehicleModel.fromJson(Map<String, Object?> json) =>
      _$UserVehicleModelFromJson(json);
}

extension UserVehicleModelMapper on UserVehicleModel {
  UserVehicleEntity toEntity() {
    return UserVehicleEntity(
      userId: userId,
      id: id,
      make: make,
      model: model,
      year: year,
      color: color,
      currentOdometer: currentOdometer,
      licensePlate: licensePlate,
      vin: vin,
      odometerAtRegistered: odometerAtRegistered,
      carInfoId: carInfoId
    );
  }
}