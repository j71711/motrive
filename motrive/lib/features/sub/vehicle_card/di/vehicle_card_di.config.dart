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
import 'package:motrive/features/sub/vehicle_card/data/datasources/vehicle_card_remote_data_source.dart'
    as _i835;
import 'package:motrive/features/sub/vehicle_card/data/repositories/vehicle_card_repository_data.dart'
    as _i735;
import 'package:motrive/features/sub/vehicle_card/domain/repositories/vehicle_card_repository_domain.dart'
    as _i817;
import 'package:motrive/features/sub/vehicle_card/domain/use_cases/vehicle_card_use_case.dart'
    as _i926;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initVehicleCardSub({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i835.BaseVehicleCardRemoteDataSource>(
      () => _i835.VehicleCardRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1013.UserService>(),
      ),
    );
    gh.lazySingleton<_i817.VehicleCardRepositoryDomain>(
      () => _i735.VehicleCardRepositoryData(
        gh<_i835.BaseVehicleCardRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i926.VehicleCardUseCase>(
      () => _i926.VehicleCardUseCase(gh<_i817.VehicleCardRepositoryDomain>()),
    );
    return this;
  }
}
