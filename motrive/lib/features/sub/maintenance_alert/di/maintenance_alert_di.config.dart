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
import 'package:motrive/core/services/local_notification_service.dart' as _i950;
import 'package:motrive/core/services/user_services.dart' as _i1013;
import 'package:motrive/features/sub/maintenance_alert/data/datasources/maintenance_alert_remote_data_source.dart'
    as _i394;
import 'package:motrive/features/sub/maintenance_alert/data/repositories/maintenance_alert_repository_data.dart'
    as _i689;
import 'package:motrive/features/sub/maintenance_alert/domain/repositories/maintenance_alert_repository_domain.dart'
    as _i1046;
import 'package:motrive/features/sub/maintenance_alert/domain/use_cases/maintenance_alert_use_case.dart'
    as _i625;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initMaintenanceAlertSub({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i394.BaseMaintenanceAlertRemoteDataSource>(
      () => _i394.MaintenanceAlertRemoteDataSource(
        gh<_i56.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
        gh<_i1013.UserService>(),
        gh<_i950.LocalNotificationService>(),
      ),
    );
    gh.lazySingleton<_i1046.MaintenanceAlertRepositoryDomain>(
      () => _i689.MaintenanceAlertRepositoryData(
        gh<_i394.BaseMaintenanceAlertRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i625.MaintenanceAlertUseCase>(
      () => _i625.MaintenanceAlertUseCase(
        gh<_i1046.MaintenanceAlertRepositoryDomain>(),
      ),
    );
    return this;
  }
}
