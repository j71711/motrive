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
import 'package:motrive/core/services/user_services.dart' as _i1013;
import 'package:motrive/features/add_vehicle/data/datasources/add_vehicle_remote_data_source.dart'
    as _i297;
import 'package:motrive/features/add_vehicle/data/repositories/add_vehicle_repository_data.dart'
    as _i923;
import 'package:motrive/features/add_vehicle/domain/repositories/add_vehicle_repository_domain.dart'
    as _i386;
import 'package:motrive/features/add_vehicle/domain/use_cases/add_vehicle_use_case.dart'
    as _i589;
import 'package:motrive/features/add_vehicle/sub/add_car_card/data/datasources/add_car_card_remote_data_source.dart'
    as _i25;
import 'package:motrive/features/add_vehicle/sub/add_car_card/data/repositories/add_car_repository_data.dart'
    as _i36;
import 'package:motrive/features/add_vehicle/sub/add_car_card/domain/repositories/add_car_card_repository_domain.dart'
    as _i376;
import 'package:motrive/features/add_vehicle/sub/add_car_card/domain/use_cases/add_car_card_use_case.dart'
    as _i1024;
import 'package:motrive/features/add_vehicle/sub/cars_info/data/datasources/cars_info_remote_data_source.dart'
    as _i699;
import 'package:motrive/features/add_vehicle/sub/cars_info/data/repositories/cars_info_repository_data.dart'
    as _i897;
import 'package:motrive/features/add_vehicle/sub/cars_info/domain/repositories/cars_info_repository_domain.dart'
    as _i513;
import 'package:motrive/features/add_vehicle/sub/cars_info/domain/use_cases/cars_info_use_case.dart'
    as _i177;
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/data/datasources/scan_vehicle_remote_data_source.dart'
    as _i407;
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/data/repositories/scan_vehicle_repository_data.dart'
    as _i817;
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/domain/repositories/scan_vehicle_repository_domain.dart'
    as _i823;
import 'package:motrive/features/add_vehicle/sub/scan_vehicle/domain/use_cases/scan_vehicle_use_case.dart'
    as _i76;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAddVehicle({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i25.BaseAddCarCardRemoteDataSource>(
      () => _i25.AddCarCardRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i699.BaseCarsInfoRemoteDataSource>(
      () => _i699.CarsInfoRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i25.VehicleLocalDataSource>(
      () => _i25.VehicleLocalDataSourceImpl(gh<_i979.Box<dynamic>>()),
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
    gh.lazySingleton<_i513.CarsInfoRepositoryDomain>(
      () => _i897.CarsInfoRepositoryData(
        gh<_i699.BaseCarsInfoRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i376.AddCarCardRepositoryDomain>(
      () => _i36.AddCarCardRepositoryData(
        gh<_i25.BaseAddCarCardRemoteDataSource>(),
        gh<_i25.VehicleLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i823.ScanVehicleRepositoryDomain>(
      () => _i817.ScanVehicleRepositoryData(
        gh<_i407.BaseScanVehicleRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1024.AddCarCardUseCase>(
      () => _i1024.AddCarCardUseCase(gh<_i376.AddCarCardRepositoryDomain>()),
    );
    gh.lazySingleton<_i76.ScanVehicleUseCase>(
      () => _i76.ScanVehicleUseCase(gh<_i823.ScanVehicleRepositoryDomain>()),
    );
    gh.lazySingleton<_i177.CarsInfoUseCase>(
      () => _i177.CarsInfoUseCase(gh<_i513.CarsInfoRepositoryDomain>()),
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
