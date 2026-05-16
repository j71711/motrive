import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:motrive/features/home/sub/scan_vehicle/domain/entities/scan_vehicle_entity.dart';
part 'scan_vehicle_model.freezed.dart';
part 'scan_vehicle_model.g.dart';

@freezed
//VehicleModel 
abstract class ScanVehicleModel with _$ScanVehicleModel {
  const factory ScanVehicleModel({
  required String make,
  required String model,
  required int year,
   String? color,
   @JsonKey(name: 'license_plate')
   String? licensePlate,
   String? vin,
   @JsonKey(name: 'current_odometer')
   int? currentOdometer,
   @JsonKey(name: 'created_at')
   DateTime? createdAt, 
   @JsonKey(name: 'car_info_id')
   String? carInfoId ,
  }) = _ScanVehicleModel;

  factory ScanVehicleModel.fromJson(Map<String, Object?> json) => _$ScanVehicleModelFromJson(json);
}

extension ScanVehicleModelMapper on ScanVehicleModel {
  ScanVehicleEntity toEntity() {
    return ScanVehicleEntity(vin: vin, make: make, model: model, year: year, color: color, licensePlate: licensePlate, currentOdometer: currentOdometer, createdAt: createdAt?.toIso8601String(), carInfoId: carInfoId,);
  }
  }

