// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaintenanceDetailsModel _$MaintenanceDetailsModelFromJson(
  Map<String, dynamic> json,
) => _MaintenanceDetailsModel(
  id: (json['id'] as num).toInt(),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
);

Map<String, dynamic> _$MaintenanceDetailsModelToJson(
  _MaintenanceDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
};
