// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignOutModel _$SignOutModelFromJson(Map<String, dynamic> json) =>
    _SignOutModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$SignOutModelToJson(_SignOutModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
