import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home/sub/chat_bot/domain/repositories/chat_bot_repository_domain.dart';


@lazySingleton
class ChatBotUseCase {
  final ChatBotRepositoryDomain _repositoryData;
  ChatBotUseCase(this._repositoryData);

  Future<Result<String, Failure>> sendMessage(String message) {
    return _repositoryData.sendMessage(message);
  }
}
