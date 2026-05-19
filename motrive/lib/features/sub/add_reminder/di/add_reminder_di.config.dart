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
import 'package:motrive/core/services/local_notification_service.dart' as _i950;
import 'package:motrive/core/services/user_services.dart' as _i1013;
import 'package:motrive/features/sub/add_reminder/data/datasources/add_reminder_remote_data_source.dart'
    as _i749;
import 'package:motrive/features/sub/add_reminder/data/repositories/add_reminder_repository_data.dart'
    as _i746;
import 'package:motrive/features/sub/add_reminder/domain/repositories/add_reminder_repository_domain.dart'
    as _i951;
import 'package:motrive/features/sub/add_reminder/domain/use_cases/add_reminder_use_case.dart'
    as _i188;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAddReminderSub({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i749.BaseAddReminderRemoteDataSource>(
      () => _i749.AddReminderRemoteDataSource(
        gh<_i1013.UserService>(),
        gh<_i454.SupabaseClient>(),
        gh<_i950.LocalNotificationService>(),
      ),
    );
    gh.lazySingleton<_i951.AddReminderRepositoryDomain>(
      () => _i746.AddReminderRepositoryData(
        gh<_i749.BaseAddReminderRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i188.AddReminderUseCase>(
      () => _i188.AddReminderUseCase(gh<_i951.AddReminderRepositoryDomain>()),
    );
    return this;
  }
}
