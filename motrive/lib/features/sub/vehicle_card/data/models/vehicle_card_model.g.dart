// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleCardModel _$VehicleCardModelFromJson(Map<String, dynamic> json) =>
    _VehicleCardModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$VehicleCardModelToJson(_VehicleCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
