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
import 'package:motrive/features/add_vehicle/data/datasources/add_vehicle_remote_data_source.dart'
    as _i297;
import 'package:motrive/features/add_vehicle/data/repositories/add_vehicle_repository_data.dart'
    as _i923;
import 'package:motrive/features/add_vehicle/domain/repositories/add_vehicle_repository_domain.dart'
    as _i386;
import 'package:motrive/features/add_vehicle/domain/use_cases/add_vehicle_use_case.dart'
    as _i589;
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/data/datasources/scan_vehicle_remote_data_source.dart'
    as _i407;
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/data/repositories/scan_vehicle_repository_data.dart'
    as _i817;
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/domain/use_cases/scan_vehicle_use_case.dart'
    as _i76;
import 'package:motrive/features/home/sub/scan_vehicle/data/datasources/scan_vehicle_remote_data_source.dart'
    as _i353;
import 'package:motrive/features/home/sub/scan_vehicle/domain/repositories/scan_vehicle_repository_domain.dart'
    as _i723;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAddVehicle({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i723.ScanVehicleRepositoryDomain>(
      () => _i817.ScanVehicleRepositoryData(
        gh<_i353.BaseScanVehicleRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i76.ScanVehicleUseCase>(
      () => _i76.ScanVehicleUseCase(gh<_i723.ScanVehicleRepositoryDomain>()),
    );
    gh.lazySingleton<_i407.BaseScanVehicleRemoteDataSource>(
      () => _i407.ScanVehicleRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1013.UserService>(),
      ),
    );
    gh.lazySingleton<_i297.BaseAddVehicleRemoteDataSource>(
      () => _i297.AddVehicleRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1013.UserService>(),
      ),
    );
    gh.lazySingleton<_i386.AddVehicleRepositoryDomain>(
      () => _i923.AddVehicleRepositoryData(
        gh<_i297.BaseAddVehicleRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i589.AddVehicleUseCase>(
      () => _i589.AddVehicleUseCase(gh<_i386.AddVehicleRepositoryDomain>()),
    );
    return this;
  }
}
