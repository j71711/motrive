import 'package:injectable/injectable.dart';
import 'package:motrive/core/common/auth_model.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/loading/data/models/loading_model.dart';
import 'package:motrive/features/maintenance/data/models/vehicle/vehicle_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseLoadingRemoteDataSource {
  Future<LoadingModel> loginStatus();
}

@LazySingleton(as: BaseLoadingRemoteDataSource)
class LoadingRemoteDataSource implements BaseLoadingRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  LoadingRemoteDataSource(this._supabase, this._userService);

  @override
  Future<LoadingModel> loginStatus() async {
    try {
      if (_supabase.auth.currentUser == null) {
        return LoadingModel(isLogin: false, isUser: false);
      }

      if (_supabase.auth.currentUser!.isAnonymous) {
        return LoadingModel(isLogin: true, isUser: false);
      }
      final userInfo = await _supabase
          .from('users')
          .select()
          .eq('auth_id', _supabase.auth.currentUser!.id)
          .single();
      final userCar = await _supabase
          .from('vehicles')
          .select()
          .eq('user_id', userInfo['id'])
          .maybeSingle();

      _userService.setUser = AuthModel.fromJson(userInfo).toEntity();
      if (userCar != null) {
        _userService.setVehicle = UserVehicleModel.fromJson(userCar);
      }

      return LoadingModel(isLogin: true, isUser: true);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
