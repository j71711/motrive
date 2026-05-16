// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaveServiceModel _$SaveServiceModelFromJson(Map<String, dynamic> json) =>
    _SaveServiceModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$SaveServiceModelToJson(_SaveServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
