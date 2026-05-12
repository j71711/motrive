// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaintenanceDetailsModel _$MaintenanceDetailsModelFromJson(
  Map<String, dynamic> json,
) => _MaintenanceDetailsModel(
  id: json['id'] as String,
  parts: (json['parts'] as List<dynamic>)
      .map((e) => ServicePartInfoModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MaintenanceDetailsModelToJson(
  _MaintenanceDetailsModel instance,
) => <String, dynamic>{'id': instance.id, 'parts': instance.parts};
