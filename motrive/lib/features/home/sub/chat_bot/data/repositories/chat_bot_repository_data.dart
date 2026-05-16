import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/errors/failure.dart';
import 'package:motrive/features/home/sub/chat_bot/data/datasources/chat_bot_remote_data_source.dart';
import 'package:motrive/features/home/sub/chat_bot/domain/repositories/chat_bot_repository_domain.dart';

@LazySingleton(as: ChatBotRepositoryDomain)
class ChatBotRepositoryData implements ChatBotRepositoryDomain{
  final BaseChatBotRemoteDataSource remoteDataSource;

  ChatBotRepositoryData(this.remoteDataSource);

  @override
  Future<Result<String, Failure>> sendMessage(String message) async{
    try {
      final response = await remoteDataSource.sendMessage(message);
      return Success(response);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
