// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmergencyContactModel _$EmergencyContactModelFromJson(
  Map<String, dynamic> json,
) => _EmergencyContactModel(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  name: json['name'] as String,
  phoneNumber: json['phone_number'] as String,
  relation: json['relation'] as String,
  notifyEmergency: json['notify_emergency'] as bool? ?? false,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$EmergencyContactModelToJson(
  _EmergencyContactModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'name': instance.name,
  'phone_number': instance.phoneNumber,
  'relation': instance.relation,
  'notify_emergency': instance.notifyEmergency,
  'created_at': instance.createdAt?.toIso8601String(),
};
