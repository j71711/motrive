// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => _AuthModel(
  id: json['id'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  fullName: json['full_name'] as String?,
  gender: json['gender'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  dateOfBirth: json['date_of_birth'] == null
      ? null
      : DateTime.parse(json['date_of_birth'] as String),
  authId: json['auth_id'] as String?,
  notificationId: json['notification_id'] as String?,
);

Map<String, dynamic> _$AuthModelToJson(_AuthModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
      'full_name': instance.fullName,
      'gender': instance.gender,
      'avatar_url': instance.avatarUrl,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'auth_id': instance.authId,
      'notification_id': instance.notificationId,
    };
