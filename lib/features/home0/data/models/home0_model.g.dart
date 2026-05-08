// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home0_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Home0Model _$Home0ModelFromJson(Map<String, dynamic> json) => _Home0Model(
  id: (json['id'] as num).toInt(),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
);

Map<String, dynamic> _$Home0ModelToJson(_Home0Model instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
