// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParkingModel _$ParkingModelFromJson(Map<String, dynamic> json) =>
    _ParkingModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      vehicleId: json['vehicle_id'] as String?,
      latitudes: (json['latitudes'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String?,
      notes: json['notes'] as String?,
      detectionMethod: json['detection_method'] as String,
      isActive: json['is_active'] as bool,
      parkedAt: json['parked_at'] as String,
    );

Map<String, dynamic> _$ParkingModelToJson(_ParkingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'vehicle_id': instance.vehicleId,
      'latitudes': instance.latitudes,
      'longitude': instance.longitude,
      'address': instance.address,
      'notes': instance.notes,
      'detection_method': instance.detectionMethod,
      'is_active': instance.isActive,
      'parked_at': instance.parkedAt,
    };
