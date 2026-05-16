import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/core/constants/app_colors.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/features/home/sub/chat_bot/domain/entities/chat_bot_entity.dart';
import 'package:motrive/features/home/sub/chat_bot/presentation/cubit/chat_bot_cubit.dart';
import 'package:motrive/features/home/sub/chat_bot/presentation/cubit/chat_bot_state.dart';

class ChatBotFeatureWidget extends StatelessWidget {
  const ChatBotFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBotCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<ChatBotCubit>();
          return Scaffold(
            appBar: AppBar(title: Text('Chat Bot')),
            resizeToAvoidBottomInset: true,
            body: Column(
              children: [
                Expanded(
                  child: BlocConsumer<ChatBotCubit, ChatBotState>(
                    builder: (context, state) {
                      List<ChatBotEntity> currentMessages = [];
                      if (state is ChatBotSLoadedState) {
                        currentMessages = state.messages;
                      } else {
                        currentMessages = cubit.messages; 
                      }
                      return ListView.builder(
                        itemCount: currentMessages.length,
                        itemBuilder: (context, index) {
                          final msg = currentMessages[index];
                          return Align(
                            alignment: msg.role == 'user'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.all(12),
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: msg.role == 'user'
                                    ? AppColors.secondary
                                    : AppColors.disabled,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                msg.content,
                                style: TextStyle(color: AppColors.textPrimary),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    listener: (BuildContext context, ChatBotState state) {
                      if (state is ChatBotErrorState) {
                        context.showSnackBar(state.message);
                      }
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: TextField(controller: cubit.controller)),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        cubit.sendMessage(cubit.controller.text);
                        cubit.controller.clear();
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
