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
import 'package:motrive/features/sub/last_odometer/data/datasources/last_odometer_remote_data_source.dart'
    as _i1069;
import 'package:motrive/features/sub/last_odometer/data/repositories/last_odometer_repository_data.dart'
    as _i640;
import 'package:motrive/features/sub/last_odometer/domain/repositories/last_odometer_repository_domain.dart'
    as _i837;
import 'package:motrive/features/sub/last_odometer/domain/use_cases/last_odometer_use_case.dart'
    as _i982;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLastOdometerSub({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i1069.BaseLastOdometerRemoteDataSource>(
      () => _i1069.LastOdometerRemoteDataSource(
        gh<_i1013.UserService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i837.LastOdometerRepositoryDomain>(
      () => _i640.LastOdometerRepositoryData(
        gh<_i1069.BaseLastOdometerRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i982.LastOdometerUseCase>(
      () => _i982.LastOdometerUseCase(gh<_i837.LastOdometerRepositoryDomain>()),
    );
    return this;
  }
}
