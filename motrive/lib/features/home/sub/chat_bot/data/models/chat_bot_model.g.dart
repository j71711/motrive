// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_bot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatBotModel _$ChatBotModelFromJson(Map<String, dynamic> json) =>
    _ChatBotModel(
      id: json['id'] as String,
      role: json['role'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$ChatBotModelToJson(_ChatBotModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'content': instance.content,
    };
