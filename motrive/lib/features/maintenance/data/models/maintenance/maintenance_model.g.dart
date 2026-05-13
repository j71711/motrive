// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaintenanceModel _$MaintenanceModelFromJson(Map<String, dynamic> json) =>
    _MaintenanceModel(
      vehicle: VehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
      services: (json['services'] as List<dynamic>)
          .map((e) => ServiceInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MaintenanceModelToJson(_MaintenanceModel instance) =>
    <String, dynamic>{
      'vehicle': instance.vehicle,
      'services': instance.services,
    };
