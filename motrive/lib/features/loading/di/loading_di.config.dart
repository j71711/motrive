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
import 'package:motrive/core/services/user_services.dart' as _i1013;
import 'package:motrive/features/loading/data/datasources/loading_remote_data_source.dart'
    as _i795;
import 'package:motrive/features/loading/data/repositories/loading_repository_data.dart'
    as _i137;
import 'package:motrive/features/loading/domain/repositories/loading_repository_domain.dart'
    as _i344;
import 'package:motrive/features/loading/domain/use_cases/loading_use_case.dart'
    as _i17;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLoading({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i795.BaseLoadingRemoteDataSource>(
      () => _i795.LoadingRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1013.UserService>(),
      ),
    );
    gh.lazySingleton<_i344.LoadingRepositoryDomain>(
      () =>
          _i137.LoadingRepositoryData(gh<_i795.BaseLoadingRemoteDataSource>()),
    );
    gh.lazySingleton<_i17.LoadingUseCase>(
      () => _i17.LoadingUseCase(gh<_i344.LoadingRepositoryDomain>()),
    );
    return this;
  }
}
