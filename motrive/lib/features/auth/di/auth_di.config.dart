// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:motrive/core/services/user_services.dart' as _i1013;
import 'package:motrive/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i727;
import 'package:motrive/features/auth/data/repositories/auth_repository_data.dart'
    as _i240;
import 'package:motrive/features/auth/domain/repositories/auth_repository_domain.dart'
    as _i583;
import 'package:motrive/features/auth/domain/use_cases/auth_use_case.dart'
    as _i45;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAuth({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i727.BaseAuthRemoteDataSource>(
      () => _i727.AuthRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i116.GoogleSignIn>(),
        gh<_i1013.UserService>(),
      ),
    );
    gh.lazySingleton<_i583.AuthRepositoryDomain>(
      () => _i240.AuthRepositoryData(gh<_i727.BaseAuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i45.AuthUseCase>(
      () => _i45.AuthUseCase(gh<_i583.AuthRepositoryDomain>()),
    );
    return this;
  }
}
