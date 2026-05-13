import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


abstract class BaseSignOutRemoteDataSource {
  Future<void> getSignOut();
}

@LazySingleton(as: BaseSignOutRemoteDataSource)
class SignOutRemoteDataSource implements BaseSignOutRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  SignOutRemoteDataSource(this._userService, this._supabase);

  @override
  Future<void> getSignOut() async {
    try {
      await _supabase.auth.signOut();
      _userService.signOut();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
