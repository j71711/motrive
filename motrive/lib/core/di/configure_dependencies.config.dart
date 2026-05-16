// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:get_storage/get_storage.dart' as _i792;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../network/dio_client.dart' as _i667;
import '../services/emergency_service.dart' as _i214;
import '../services/local_keys_service.dart' as _i945;
import '../services/user_services.dart' as _i898;
import 'app_module.dart' as _i460;
import 'third_part.dart' as _i423;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    final thirdPartyConfig = _$ThirdPartyConfig();
    gh.lazySingleton<_i979.Box<dynamic>>(() => appModule.vehiclesBox);
    gh.lazySingleton<_i792.GetStorage>(() => thirdPartyConfig.storage);
    gh.lazySingleton<_i454.SupabaseClient>(
      () => thirdPartyConfig.supabaseClient,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => thirdPartyConfig.flutterSecureStorage,
    );
    gh.lazySingleton<_i116.GoogleSignIn>(() => thirdPartyConfig.googleSignIn);
    gh.lazySingleton<_i667.DioClient>(() => _i667.DioClient());
    gh.lazySingleton<_i214.EmergencyService>(() => _i214.EmergencyService());
    gh.lazySingleton<_i898.UserService>(() => _i898.UserService());
    gh.singleton<_i945.LocalKeysService>(() => _i945.LocalKeysService());
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}

class _$ThirdPartyConfig extends _i423.ThirdPartyConfig {}
