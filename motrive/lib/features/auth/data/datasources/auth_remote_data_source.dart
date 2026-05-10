import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/common/auth_model.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:motrive/core/errors/network_exceptions.dart';

abstract class BaseAuthRemoteDataSource {
  Future<AuthModel> getAuth();
  Future<AuthModel> googleSignIn();
  Future<AuthModel> emailVerify({required String email, required String otp});
  Future<void> emailSignIn({required String email, String? name});
}

@LazySingleton(as: BaseAuthRemoteDataSource)
class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final SupabaseClient _supabase;
  final GoogleSignIn _googleSignIn;
  final UserService _userService;

  AuthRemoteDataSource(this._supabase, this._googleSignIn, this._userService);

  @override
  Future<AuthModel> getAuth() async {
    try {
      return AuthModel.fromJson({});
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<AuthModel> googleSignIn() async {
    final googleAccount = await _googleSignIn.authenticate();
    final googleAuthorization = await googleAccount.authorizationClient
        .authorizationForScopes(['email', 'profile']);
    final googleAuthentication = googleAccount.authentication;
    final idToken = googleAuthentication.idToken;
    final accessToken = googleAuthorization?.accessToken;

    if (idToken == null) {
      throw 'No ID Token found.';
    }

    await _supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    final userInfo = await insertOrGetUser(
      authId: _supabase.auth.currentUser!.id,
      name: googleAccount.displayName ?? 'Name',
      email: googleAccount.email,
      profile: googleAccount.photoUrl,
    );

    _userService.setUser = AuthModel.fromJson(userInfo).toEntity();

    return AuthModel.fromJson(userInfo);
  }

  @override
  Future<AuthModel> emailVerify({
    required String email,
    required String otp,
  }) async {
    final userAuth = await _supabase.auth.verifyOTP(
      type: OtpType.email,
      token: otp,
      email: email,
    );
    final name = userAuth.user!.userMetadata?['full_name']??"";

    final userInfo = await insertOrGetUser(
      authId: userAuth.user!.id,
      name: name,
      email: email,
    );

    _userService.setUser = AuthModel.fromJson(userInfo).toEntity();

    return AuthModel.fromJson(userInfo);
  }

  @override
  Future<void> emailSignIn({required String email, String? name}) async {
    await _supabase.auth.signInWithOtp(email: email, data: {'full_name': name});
  }
 Future<Map<String, dynamic>> insertOrGetUser({
  required String authId,
  required String name,
  required String email,
  String? profile,
}) async {
  final response = await _supabase
      .from('users')
      .select()
      .eq('id', authId)
      .maybeSingle();

  if (response != null) {
    return response;
  }

  final newUser = await _supabase
      .from('users')
      .insert({
        'id': authId,
        'email': email,
        'full_name': name,
      })
      .select()
      .single();

  return newUser;
}

}
