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
import 'package:motrive/core/services/local_notification_service.dart' as _i950;
import 'package:motrive/core/services/user_services.dart' as _i1013;
import 'package:motrive/features/sub/save_service/data/datasources/save_service_local_data_source.dart'
    as _i302;
import 'package:motrive/features/sub/save_service/data/datasources/save_service_remote_data_source.dart'
    as _i1012;
import 'package:motrive/features/sub/save_service/data/repositories/save_service_repository_data.dart'
    as _i796;
import 'package:motrive/features/sub/save_service/domain/repositories/save_service_repository_domain.dart'
    as _i823;
import 'package:motrive/features/sub/save_service/domain/use_cases/save_service_use_case.dart'
    as _i315;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initSaveServiceSub({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i302.BaseSaveServiceLocalDataSource>(
      () => _i302.SaveServiceLocalDataSource(gh<_i744.Box<dynamic>>()),
    );
    gh.lazySingleton<_i1012.BaseSaveServiceRemoteDataSource>(
      () => _i1012.SaveServiceRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1013.UserService>(),
        gh<_i950.LocalNotificationService>(),
      ),
    );
    gh.lazySingleton<_i823.SaveServiceRepositoryDomain>(
      () => _i796.SaveServiceRepositoryData(
        gh<_i1012.BaseSaveServiceRemoteDataSource>(),
        gh<_i302.BaseSaveServiceLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i315.SaveServiceUseCase>(
      () => _i315.SaveServiceUseCase(gh<_i823.SaveServiceRepositoryDomain>()),
    );
    return this;
  }
}
