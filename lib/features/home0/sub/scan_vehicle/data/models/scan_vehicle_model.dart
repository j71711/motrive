import 'package:motrive/features/home0/sub/scan_vehicle/domain/entities/scan_vehicle_entity.dart';
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



// class ScanVehicleModel extends ScanVehicleEntity {
//    ScanVehicleModel({
//     required super.vin,
//     required super.make,
//     required super.model,
//     required super.year,
//   });

//   factory ScanVehicleModel.fromJson(Map<String, dynamic> json) {
//     return ScanVehicleModel(
//       vin: json['vin'],
//       make: json['make'],
//       model: json['model'],
//       year: json['year'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'vin': vin,
//       'make': make,
//       'model': model,
//       'year': year,
//     };
//   }
// }