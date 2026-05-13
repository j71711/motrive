// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserVehicleModel _$UserVehicleModelFromJson(Map<String, dynamic> json) =>
    _UserVehicleModel(
      userId: json['user_id'] as String,
      id: json['id'] as String,
      make: json['make'] as String,
      model: json['model'] as String,
      year: (json['year'] as num).toInt(),
      color: json['color'] as String?,
      licensePlate: json['license_plate'] as String?,
      vin: json['vin'] as String?,
      currentOdometer: (json['current_odometer'] as num?)?.toInt(),
      odometerAtRegistered: (json['odometer_at_registered'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserVehicleModelToJson(_UserVehicleModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'id': instance.id,
      'make': instance.make,
      'model': instance.model,
      'year': instance.year,
      'color': instance.color,
      'license_plate': instance.licensePlate,
      'vin': instance.vin,
      'current_odometer': instance.currentOdometer,
      'odometer_at_registered': instance.odometerAtRegistered,
    };
