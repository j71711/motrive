// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_car_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddCarCardModel _$AddCarCardModelFromJson(Map<String, dynamic> json) =>
    _AddCarCardModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$AddCarCardModelToJson(_AddCarCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
