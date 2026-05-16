import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/home/sub/chat_bot/domain/entities/chat_bot_entity.dart';
import 'package:motrive/features/home/sub/chat_bot/domain/use_cases/chat_bot_use_case.dart';
import 'package:motrive/features/home/sub/chat_bot/presentation/cubit/chat_bot_state.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  final ChatBotUseCase _chatBotUseCase;

  ChatBotCubit(this._chatBotUseCase) : super(ChatBotInitialState());

  final controller = TextEditingController();
  List<ChatBotEntity> messages = [];

    Future<void> sendMessage(String text) async {
      if (text.isEmpty) return;
    messages.add(ChatBotEntity(role: 'user', content: text));
    emit(ChatBotSLoadingState());

    final result = await _chatBotUseCase.sendMessage(text);
    result.when(
      (success) {
        messages.add(ChatBotEntity(role: 'bot', content: success));
        emit(ChatBotSLoadedState([...messages]));
      },
      (whenError) => emit(ChatBotErrorState(whenError.message)),);
    }
  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}