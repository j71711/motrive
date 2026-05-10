// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:motrive/core/services/local_keys_service.dart' as _i56;
import 'package:motrive/features/home/data/datasources/home_remote_data_source.dart'
    as _i68;
import 'package:motrive/features/home/data/repositories/home_repository_data.dart'
    as _i248;
import 'package:motrive/features/home/domain/repositories/home_repository_domain.dart'
    as _i445;
import 'package:motrive/features/home/domain/use_cases/home_use_case.dart'
    as _i463;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHome({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i68.BaseHomeRemoteDataSource>(
      () => _i68.HomeRemoteDataSource(
        gh<_i56.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i445.HomeRepositoryDomain>(
      () => _i248.HomeRepositoryData(gh<_i68.BaseHomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i463.HomeUseCase>(
      () => _i463.HomeUseCase(gh<_i445.HomeRepositoryDomain>()),
    );
    return this;
  }
}
