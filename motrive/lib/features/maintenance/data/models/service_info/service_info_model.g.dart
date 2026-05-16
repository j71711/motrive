// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceInfoModel _$ServiceInfoModelFromJson(Map<String, dynamic> json) =>
    _ServiceInfoModel(
      id: json['id'] as String,
      serviceOdometer: (json['service_odometer'] as num).toInt(),
      dateIntervalMonths: (json['date_interval_months'] as num).toInt(),
      severity: json['severity'] as String,
      recommendation: json['recommendation'] as String,
      done: json['done'] as bool?,
    );

Map<String, dynamic> _$ServiceInfoModelToJson(_ServiceInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service_odometer': instance.serviceOdometer,
      'date_interval_months': instance.dateIntervalMonths,
      'severity': instance.severity,
      'recommendation': instance.recommendation,
      'done': instance.done,
    };
