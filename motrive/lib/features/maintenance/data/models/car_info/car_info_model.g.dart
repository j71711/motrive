// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CarInfoModel _$CarInfoModelFromJson(Map<String, dynamic> json) =>
    _CarInfoModel(
      id: json['id'] as String,
      make: json['make'] as String,
      model: json['model'] as String,
      year: (json['year'] as num).toInt(),
      engine: json['engine'] as String,
      manualSource: json['manual_source'] as String,
      maintenanceOdometerInterval:
          (json['maintenance_odometer_interval'] as num).toInt(),
    );

Map<String, dynamic> _$CarInfoModelToJson(_CarInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'make': instance.make,
      'model': instance.model,
      'year': instance.year,
      'engine': instance.engine,
      'manual_source': instance.manualSource,
      'maintenance_odometer_interval': instance.maintenanceOdometerInterval,
    };
