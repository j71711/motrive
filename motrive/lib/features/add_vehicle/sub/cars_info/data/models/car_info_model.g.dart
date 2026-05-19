// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CarsInfoModel _$CarsInfoModelFromJson(Map<String, dynamic> json) =>
    _CarsInfoModel(
      id: json['id'] as String,
      make: json['make'] as String,
      model: json['model'] as String,
      year: (json['year'] as num).toInt(),
      engine: json['engine'] as String?,
      manualSource: json['manual_source'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$CarsInfoModelToJson(_CarsInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'make': instance.make,
      'model': instance.model,
      'year': instance.year,
      'engine': instance.engine,
      'manual_source': instance.manualSource,
      'created_at': instance.createdAt?.toIso8601String(),
    };
