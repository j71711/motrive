// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_car_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddCarCardModel _$AddCarCardModelFromJson(Map<String, dynamic> json) =>
    _AddCarCardModel(
      userId: json['user_id'] as String,
      id: json['id'] as String,
      make: json['make'] as String,
      model: json['model'] as String,
      year: (json['year'] as num).toInt(),
      color: json['color'] as String?,
      licensePlate: json['license_plate'] as String?,
      vin: json['vin'] as String?,
      currentOdometer: (json['current_odometer'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      carInfoId: json['car_info_id'] as String?,
    );

Map<String, dynamic> _$AddCarCardModelToJson(_AddCarCardModel instance) =>
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
      'created_at': instance.createdAt?.toIso8601String(),
      'car_info_id': instance.carInfoId,
    };
