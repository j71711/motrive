import 'package:multiple_result/multiple_result.dart';
import 'package:motrive/core/errors/failure.dart';

abstract class ChatBotRepositoryDomain {
  Future<Result<String,Failure>> sendMessage(String message);
}
