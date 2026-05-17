import 'package:equatable/equatable.dart';

class ChatBotEntity extends Equatable {
  final String role;
  final String content;

  const ChatBotEntity({
    required this.role,
    required this.content,
  });

  @override
  List<Object?> get props => [role, content];
}
