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
import 'package:motrive/features/reminders/data/datasources/reminders_remote_data_source.dart'
    as _i321;
import 'package:motrive/features/reminders/data/repositories/reminders_repository_data.dart'
    as _i165;
import 'package:motrive/features/reminders/domain/repositories/reminders_repository_domain.dart'
    as _i436;
import 'package:motrive/features/reminders/domain/use_cases/reminders_use_case.dart'
    as _i797;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initReminders({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i321.BaseRemindersRemoteDataSource>(
      () => _i321.RemindersRemoteDataSource(
        gh<_i1013.UserService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i436.RemindersRepositoryDomain>(
      () => _i165.RemindersRepositoryData(
        gh<_i321.BaseRemindersRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i797.RemindersUseCase>(
      () => _i797.RemindersUseCase(gh<_i436.RemindersRepositoryDomain>()),
    );
    return this;
  }
}
