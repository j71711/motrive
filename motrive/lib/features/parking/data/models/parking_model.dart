import 'package:motrive/features/parking/domain/entities/parking_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'parking_model.freezed.dart';
part 'parking_model.g.dart';

@freezed
abstract class ParkingModel with _$ParkingModel {
  const factory ParkingModel({
    required String id,

    @JsonKey(name: 'user_id')
    required String userId,

    @JsonKey(name: 'vehicle_id')
    String? vehicleId,

 required double latitudes,

required double longitude,

    String? address,

    String? notes,

    @JsonKey(name: 'detection_method')
    required String detectionMethod,

    @JsonKey(name: 'is_active')
    required bool isActive,

    @JsonKey(name: 'parked_at')
    required String parkedAt,
  }) = _ParkingModel;

  factory ParkingModel.fromJson(
    Map<String, Object?> json,
  ) => _$ParkingModelFromJson(json);
}

extension ParkingModelMapper on ParkingModel {
  ParkingEntity toEntity() {
    return ParkingEntity(
      id: id,
      userId: userId,
      vehicleId: vehicleId,
  latitudes: latitudes,
      longitude: longitude,
      address: address,
      notes: notes,
      detectionMethod: detectionMethod,
      isActive: isActive,
      parkedAt: parkedAt,
    );
  }
}