// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:motrive/core/services/local_keys_service.dart' as _i56;
import 'package:motrive/features/home0/data/datasources/home0_remote_data_source.dart'
    as _i952;
import 'package:motrive/features/home0/data/repositories/home0_repository_data.dart'
    as _i248;
import 'package:motrive/features/home0/domain/repositories/home0_repository_domain.dart'
    as _i827;
import 'package:motrive/features/home0/domain/use_cases/home0_use_case.dart'
    as _i511;
import 'package:motrive/features/home0/sub/add_car_card/data/datasources/add_car_card_remote_data_source.dart'
    as _i106;
import 'package:motrive/features/home0/sub/add_car_card/data/repositories/add_car_repository_data.dart'
    as _i115;
import 'package:motrive/features/home0/sub/add_car_card/domain/repositories/add_car_card_repository_domain.dart'
    as _i10;
import 'package:motrive/features/home0/sub/add_car_card/domain/use_cases/add_car_card_use_case.dart'
    as _i333;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHome0({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i106.VehicleLocalDataSource>(
      () => _i106.VehicleLocalDataSourceImpl(gh<_i979.Box<dynamic>>()),
    );
    gh.lazySingleton<_i333.AddCarUseCase0>(
      () => _i333.AddCarUseCase0(gh<_i10.VehicleLocalDataSource>()),
    );
    gh.lazySingleton<_i952.BaseHome0RemoteDataSource>(
      () => _i952.Home0RemoteDataSource(
        gh<_i56.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i106.BaseAddCarCardRemoteDataSource>(
      () => _i106.AddCarCardRemoteDataSource(
        gh<_i56.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i827.Home0RepositoryDomain>(
      () => _i248.Home0RepositoryData(gh<_i952.BaseHome0RemoteDataSource>()),
    );
    gh.lazySingleton<_i10.AddCarCardRepositoryDomain>(
      () => _i115.AddCarCardRepositoryData(
        gh<_i106.BaseAddCarCardRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i511.Home0UseCase>(
      () => _i511.Home0UseCase(gh<_i827.Home0RepositoryDomain>()),
    );
    gh.lazySingleton<_i333.AddCarCardUseCase>(
      () => _i333.AddCarCardUseCase(gh<_i10.AddCarCardRepositoryDomain>()),
    );
    return this;
  }
}
