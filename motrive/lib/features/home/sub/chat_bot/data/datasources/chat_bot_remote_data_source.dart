import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/core/services/local_keys_service.dart';

abstract class BaseChatBotRemoteDataSource {
  Future<String> sendMessage(String message);
}

@LazySingleton(as: BaseChatBotRemoteDataSource)
class ChatBotRemoteDataSource implements BaseChatBotRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  ChatBotRemoteDataSource(this._localKeysService, this._supabase);
  @override
  Future<String> sendMessage(String message) async {
    final user = _supabase.auth.currentUser;
    final response = await _supabase.functions.invoke(
      'chat-bot',
      body: {"message": message, "user_id": user?.id ?? 'guest'},
    );
    return response.data['reply'] ?? '';
  }
}
