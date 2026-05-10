import 'package:motrive/features/home/sub/scan_vehicle/domain/entities/scan_vehicle_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'scan_vehicle_model.freezed.dart';
part 'scan_vehicle_model.g.dart';

@freezed
abstract class ScanVehicleModel with _$ScanVehicleModel {
  const factory ScanVehicleModel({
    required String vin,
    required String make,
    required String model,
    required int year,
    
  }) = _ScanVehicleModel;

  factory ScanVehicleModel.fromJson(Map<String, Object?> json) => _$ScanVehicleModelFromJson(json);
}



extension ScanVehicleModelMapper on ScanVehicleModel {
  ScanVehicleEntity toEntity() {
    return ScanVehicleEntity(vin: vin, make: make, model: model, year: year);
  }
  }

