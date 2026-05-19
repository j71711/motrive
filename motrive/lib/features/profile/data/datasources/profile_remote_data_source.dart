import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/profile/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

@LazySingleton(as: BaseProfileRemoteDataSource)
class ProfileRemoteDataSource implements BaseProfileRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  ProfileRemoteDataSource(
    this._supabase,
    this._userService,
  );

  @override
  Future<ProfileModel> getProfile() async {
    final authId = _userService.currentUser?.id;

    if (authId == null) {
      throw Exception('User not logged in');
    }

    final response = await _supabase
        .from('users')
        .select()
        .eq('auth_id', authId)
        .single();

    return ProfileModel.fromJson(response);
  }
}