// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_odometer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LastOdometerModel _$LastOdometerModelFromJson(Map<String, dynamic> json) =>
    _LastOdometerModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$LastOdometerModelToJson(_LastOdometerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
