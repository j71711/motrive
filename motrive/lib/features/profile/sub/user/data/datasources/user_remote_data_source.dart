import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/profile/sub/user/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseUserRemoteDataSource {
  Future<UserModel> getUser();

  Future<UserModel> updateUser({
    required String fullName,
    required String phone,
    required String gender,
    DateTime? dateOfBirth,
  });
}

@LazySingleton(as: BaseUserRemoteDataSource)
class UserRemoteDataSource implements BaseUserRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  UserRemoteDataSource(this._supabase, this._userService);

  @override
  Future<UserModel> getUser() async {
    try {
      final user = _userService.currentUser?.id;
      if (user == null) {
        throw Exception('User not logged in');
      }

      final response = await _supabase
          .from('users')
          .select()
          .eq('id', user)
          .maybeSingle();

      return UserModel.fromJson(response!);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<UserModel> updateUser({
    required String fullName,
    required String phone,
    required String gender,
    DateTime? dateOfBirth,
  }) async {
    try {
      final user = _userService.currentUser?.id;

      if (user == null) {
        throw Exception('User not logged in');
      }

      final response = await _supabase
          .from('users')
          .update({
            'full_name': fullName,
            if (phone.isNotEmpty) 'phone': phone,
            'gender': gender,
            'date_of_birth': dateOfBirth?.toIso8601String(),
          })
          .eq('id', user)
          .select()
          .single();

      return UserModel.fromJson(response);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
