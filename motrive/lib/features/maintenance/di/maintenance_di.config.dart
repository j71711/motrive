// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive_flutter/adapters.dart' as _i744;
import 'package:injectable/injectable.dart' as _i526;
import 'package:motrive/core/network/dio_client.dart' as _i363;
import 'package:motrive/core/services/user_services.dart' as _i1013;
import 'package:motrive/features/maintenance/data/datasources/maintenance_local_data_source.dart'
    as _i920;
import 'package:motrive/features/maintenance/data/datasources/maintenance_remote_data_source.dart'
    as _i951;
import 'package:motrive/features/maintenance/data/repositories/maintenance_repository_data.dart'
    as _i382;
import 'package:motrive/features/maintenance/domain/repositories/maintenance_repository_domain.dart'
    as _i774;
import 'package:motrive/features/maintenance/domain/use_cases/maintenance_use_case.dart'
    as _i309;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initMaintenance({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i920.BaseMaintenanceLocalDataSource>(
      () => _i920.MaintenanceLocalDataSource(gh<_i744.Box<dynamic>>()),
    );
    gh.lazySingleton<_i951.BaseMaintenanceRemoteDataSource>(
      () => _i951.MaintenanceRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1013.UserService>(),
        gh<_i363.DioClient>(),
      ),
    );
    gh.lazySingleton<_i774.MaintenanceRepositoryDomain>(
      () => _i382.MaintenanceRepositoryData(
        gh<_i951.BaseMaintenanceRemoteDataSource>(),
        gh<_i920.BaseMaintenanceLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i309.MaintenanceUseCase>(
      () => _i309.MaintenanceUseCase(gh<_i774.MaintenanceRepositoryDomain>()),
    );
    return this;
  }
}
