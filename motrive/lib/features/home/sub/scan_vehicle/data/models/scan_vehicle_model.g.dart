// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScanVehicleModel _$ScanVehicleModelFromJson(Map<String, dynamic> json) =>
    _ScanVehicleModel(
      vin: json['vin'] as String,
      make: json['make'] as String,
      model: json['model'] as String,
      year: (json['year'] as num).toInt(),
    );

Map<String, dynamic> _$ScanVehicleModelToJson(_ScanVehicleModel instance) =>
    <String, dynamic>{
      'vin': instance.vin,
      'make': instance.make,
      'model': instance.model,
      'year': instance.year,
    };
