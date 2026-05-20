import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:motrive/core/constants/app_icons.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/widgets/fade_animated_container.dart';
import 'package:motrive/features/home/sub/chat_bot/domain/entities/chat_bot_entity.dart';
import 'package:motrive/features/home/sub/chat_bot/presentation/cubit/chat_bot_cubit.dart';
import 'package:motrive/features/home/sub/chat_bot/presentation/cubit/chat_bot_state.dart';
import 'package:sizer/sizer.dart';

class ChatBotFeatureWidget extends HookWidget {
  const ChatBotFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    return BlocProvider(
      create: (_) => ChatBotCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<ChatBotCubit>();

          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text('car_assistant'.tr()),
            ),
            body: Column(
              children: [
                Expanded(
                  child: BlocConsumer<ChatBotCubit, ChatBotState>(
                    listener: (context, state) {
                      if (state is ChatBotErrorState) {
                        context.showSnackBar(state.message);
                      }
                      if (state is ChatBotSLoadedState) {
                        scrollController.animateTo(
                          scrollController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    builder: (context, state) {
                      List<ChatBotEntity> currentMessages = [];

                      if (state is ChatBotSLoadedState) {
                        currentMessages = state.messages;
                      } else {
                        currentMessages = cubit.messages;
                      }

                      if (currentMessages.isEmpty) {
                        return Center(
                          child: Text(
                            'ask_me_anything_about_your_car'.tr(),
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withValues(alpha: .6),
                              fontSize: 16,
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        controller: scrollController,
                        padding: const EdgeInsets.all(16),
                        itemCount: currentMessages.length,
                        itemBuilder: (context, index) {
                          final msg = currentMessages[index];
                          final isUser = msg.role == 'user';

                          return Align(
                            alignment: isUser
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * .75,
                              ),
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: isUser
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.primary
                                          .withValues(alpha: .08),
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(18),
                                  topRight: const Radius.circular(18),
                                  bottomLeft: Radius.circular(isUser ? 18 : 4),
                                  bottomRight: Radius.circular(isUser ? 4 : 18),
                                ),
                              ),
                              child: Text(
                                msg.content,
                                style: TextStyle(
                                  color: isUser
                                      ? Theme.of(context).colorScheme.surface
                                      : Theme.of(context).colorScheme.onSurface,
                                  fontSize: 15,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                BlocBuilder<ChatBotCubit, ChatBotState>(
                  builder: (context, state) {
                    return Align(
                      alignment: .centerStart,
                      child: CustomFadeContainer(
                        fade: state is! ChatBotSLoadingState,
                        widget: Lottie.asset(
                          AppIcons.chatLoading,
                          height: 10.w,
                        ),
                      ),
                    );
                  },
                ),

                SafeArea(
                  top: false,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: .06),
                          blurRadius: 18,
                          offset: const Offset(0, -6),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: cubit.controller,
                            minLines: 1,
                            maxLines: 4,
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            enabled: cubit.state is! ChatBotSLoadingState,
                            decoration: InputDecoration(
                              hintText: 'type_your_message'.tr(),
                              filled: true,
                              fillColor: Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: .06),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        SizedBox(
                          height: 48,
                          width: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: const CircleBorder(),
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              foregroundColor: Theme.of(
                                context,
                              ).colorScheme.surface,
                            ),
                            onPressed: () {
                              final text = cubit.controller.text.trim();

                              if (text.isEmpty) return;

                              cubit.sendMessage(text);
                              cubit.controller.clear();
                              scrollController.animateTo(
                                scrollController.position.maxScrollExtent,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: const Icon(Icons.send_rounded),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
