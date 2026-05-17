// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddVehicleModel _$AddVehicleModelFromJson(Map<String, dynamic> json) =>
    _AddVehicleModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$AddVehicleModelToJson(_AddVehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
