import 'package:motrive/features/home/sub/chat_bot/domain/entities/chat_bot_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_bot_model.freezed.dart';
part 'chat_bot_model.g.dart';

@freezed
abstract class ChatBotModel with _$ChatBotModel {
  const factory ChatBotModel({
    required String id,
    required String role,
    required String content,
    
  }) = _ChatBotModel;

  factory ChatBotModel.fromJson(Map<String, Object?> json) => _$ChatBotModelFromJson(json);
}

extension ChatBotModelMapper on ChatBotModel {
  ChatBotEntity toEntity() {
    return ChatBotEntity  (
      role: role,
      content: content,
    );
  }
  }
