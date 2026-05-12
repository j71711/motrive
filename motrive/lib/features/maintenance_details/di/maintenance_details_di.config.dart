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
import 'package:motrive/features/maintenance_details/data/datasources/maintenance_details_remote_data_source.dart'
    as _i23;
import 'package:motrive/features/maintenance_details/data/repositories/maintenance_details_repository_data.dart'
    as _i85;
import 'package:motrive/features/maintenance_details/domain/repositories/maintenance_details_repository_domain.dart'
    as _i947;
import 'package:motrive/features/maintenance_details/domain/use_cases/maintenance_details_use_case.dart'
    as _i529;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initMaintenanceDetails({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i23.BaseMaintenanceDetailsRemoteDataSource>(
      () => _i23.MaintenanceDetailsRemoteDataSource(
        gh<_i56.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i947.MaintenanceDetailsRepositoryDomain>(
      () => _i85.MaintenanceDetailsRepositoryData(
        gh<_i23.BaseMaintenanceDetailsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i529.MaintenanceDetailsUseCase>(
      () => _i529.MaintenanceDetailsUseCase(
        gh<_i947.MaintenanceDetailsRepositoryDomain>(),
      ),
    );
    return this;
  }
}
