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
import 'package:motrive/core/services/parking_service.dart' as _i806;
import 'package:motrive/core/services/user_services.dart' as _i1013;
import 'package:motrive/features/parking/data/datasources/parking_local_data_source.dart'
    as _i944;
import 'package:motrive/features/parking/data/datasources/parking_remote_data_source.dart'
    as _i851;
import 'package:motrive/features/parking/data/repositories/parking_repository_data.dart'
    as _i830;
import 'package:motrive/features/parking/domain/repositories/parking_repository_domain.dart'
    as _i465;
import 'package:motrive/features/parking/domain/use_cases/parking_use_case.dart'
    as _i673;
import 'package:motrive/features/parking/sub/parking_history/data/datasources/parking_history_remote_data_source.dart'
    as _i585;
import 'package:motrive/features/parking/sub/parking_history/data/repositories/parking_history_repository_data.dart'
    as _i262;
import 'package:motrive/features/parking/sub/parking_history/domain/repositories/parking_history_repository_domain.dart'
    as _i225;
import 'package:motrive/features/parking/sub/parking_history/domain/use_cases/parking_history_use_case.dart'
    as _i509;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initParking({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i944.BaseParkingLocalDataSource>(
      () => _i944.ParkingLocalDataSource(gh<_i744.Box<dynamic>>()),
    );
    gh.lazySingleton<_i585.BaseParkingHistoryRemoteDataSource>(
      () => _i585.ParkingHistoryRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1013.UserService>(),
      ),
    );
    gh.lazySingleton<_i851.BaseParkingRemoteDataSource>(
      () => _i851.ParkingRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1013.UserService>(),
      ),
    );
    gh.lazySingleton<_i225.ParkingHistoryRepositoryDomain>(
      () => _i262.ParkingHistoryRepositoryData(
        gh<_i585.BaseParkingHistoryRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i465.ParkingRepositoryDomain>(
      () => _i830.ParkingRepositoryData(
        gh<_i851.BaseParkingRemoteDataSource>(),
        gh<_i806.ParkingService>(),
      ),
    );
    gh.lazySingleton<_i509.ParkingHistoryUseCase>(
      () => _i509.ParkingHistoryUseCase(
        gh<_i225.ParkingHistoryRepositoryDomain>(),
      ),
    );
    gh.lazySingleton<_i673.ParkingUseCase>(
      () => _i673.ParkingUseCase(gh<_i465.ParkingRepositoryDomain>()),
    );
    return this;
  }
}
