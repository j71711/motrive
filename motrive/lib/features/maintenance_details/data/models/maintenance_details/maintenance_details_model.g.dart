// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaintenanceDetailsModel _$MaintenanceDetailsModelFromJson(
  Map<String, dynamic> json,
) => _MaintenanceDetailsModel(
  id: json['id'] as String,
  vehicle: UserVehicleModel.fromJson(json['vehicle'] as Map<String, dynamic>),
  parts: (json['parts'] as List<dynamic>)
      .map((e) => ServicePartInfoModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MaintenanceDetailsModelToJson(
  _MaintenanceDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'vehicle': instance.vehicle,
  'parts': instance.parts,
};
