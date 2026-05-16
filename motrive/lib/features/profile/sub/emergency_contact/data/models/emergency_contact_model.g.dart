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
  email: json['email'] as String,
  relation: json['relation'] as String,
  notifyEmergency: json['notify_emergency'] as bool,
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
  'email': instance.email,
  'relation': instance.relation,
  'notify_emergency': instance.notifyEmergency,
  'created_at': instance.createdAt?.toIso8601String(),
};
