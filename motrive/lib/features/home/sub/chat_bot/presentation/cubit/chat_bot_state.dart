import 'package:equatable/equatable.dart';
import 'package:motrive/features/home/sub/chat_bot/domain/entities/chat_bot_entity.dart';

abstract class ChatBotState extends Equatable {
  const ChatBotState();

  @override
  List<Object?> get props => [];
}

class ChatBotInitialState extends ChatBotState {}
class ChatBotSuccessState extends ChatBotState {}
class ChatBotSLoadedState extends ChatBotState {
  final List<ChatBotEntity> messages;
 const ChatBotSLoadedState(this.messages);
   @override
  List<Object?> get props => [messages];
} 
class ChatBotSLoadingState extends ChatBotState {
}

class ChatBotErrorState extends ChatBotState {
  final String message;
  const ChatBotErrorState(this.message);
  @override
  List<Object?> get props => [message];
}

