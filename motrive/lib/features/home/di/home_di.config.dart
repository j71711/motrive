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
import 'package:motrive/core/services/emergency_service.dart' as _i821;
import 'package:motrive/core/services/local_keys_service.dart' as _i56;
import 'package:motrive/core/services/user_services.dart' as _i1013;
import 'package:motrive/features/home/data/datasources/home_remote_data_source.dart'
    as _i68;
import 'package:motrive/features/home/data/repositories/home_repository_data.dart'
    as _i248;
import 'package:motrive/features/home/domain/repositories/home_repository_domain.dart'
    as _i445;
import 'package:motrive/features/home/domain/use_cases/home_use_case.dart'
    as _i463;
import 'package:motrive/features/home/sub/add_car_card/data/datasources/add_car_card_remote_data_source.dart'
    as _i737;
import 'package:motrive/features/home/sub/add_car_card/data/repositories/add_car_repository_data.dart'
    as _i924;
import 'package:motrive/features/home/sub/add_car_card/domain/repositories/add_car_card_repository_domain.dart'
    as _i521;
import 'package:motrive/features/home/sub/add_car_card/domain/use_cases/add_car_card_use_case.dart'
    as _i280;
import 'package:motrive/features/home/sub/add_expense/data/datasources/add_expense_remote_data_source.dart'
    as _i921;
import 'package:motrive/features/home/sub/add_expense/data/repositories/add_expense_repository_data.dart'
    as _i391;
import 'package:motrive/features/home/sub/add_expense/domain/repositories/add_expense_repository_domain.dart'
    as _i963;
import 'package:motrive/features/home/sub/add_expense/domain/use_cases/add_expense_use_case.dart'
    as _i1057;
import 'package:motrive/features/home/sub/chat_bot/data/datasources/chat_bot_remote_data_source.dart'
    as _i279;
import 'package:motrive/features/home/sub/chat_bot/data/repositories/chat_bot_repository_data.dart'
    as _i810;
import 'package:motrive/features/home/sub/chat_bot/domain/repositories/chat_bot_repository_domain.dart'
    as _i641;
import 'package:motrive/features/home/sub/chat_bot/domain/use_cases/chat_bot_use_case.dart'
    as _i403;
import 'package:motrive/features/home/sub/scan_vehicle/data/datasources/scan_vehicle_remote_data_source.dart'
    as _i353;
import 'package:motrive/features/home/sub/scan_vehicle/data/repositories/scan_vehicle_repository_data.dart'
    as _i431;
import 'package:motrive/features/home/sub/scan_vehicle/domain/repositories/scan_vehicle_repository_domain.dart'
    as _i723;
import 'package:motrive/features/home/sub/scan_vehicle/domain/use_cases/scan_vehicle_use_case.dart'
    as _i198;
import 'package:motrive/features/home/sub/sos/data/datasources/sos_remote_data_source.dart'
    as _i558;
import 'package:motrive/features/home/sub/sos/data/repositories/sos_repository_data.dart'
    as _i630;
import 'package:motrive/features/home/sub/sos/domain/repositories/sos_repository_domain.dart'
    as _i904;
import 'package:motrive/features/home/sub/sos/domain/use_cases/sos_use_case.dart'
    as _i168;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHome({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i737.BaseAddCarCardRemoteDataSource>(
      () => _i737.AddCarCardRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i353.BaseScanVehicleRemoteDataSource>(
      () => _i353.ScanVehicleRemoteDataSource(
        gh<_i56.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
        gh<_i1013.UserService>(),
      ),
    );
    gh.lazySingleton<_i723.ScanVehicleRepositoryDomain>(
      () => _i431.ScanVehicleRepositoryData(
        gh<_i353.BaseScanVehicleRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i737.VehicleLocalDataSource>(
      () => _i737.VehicleLocalDataSourceImpl(gh<_i979.Box<dynamic>>()),
    );
    gh.lazySingleton<_i558.BaseSosRemoteDataSource>(
      () => _i558.SosRemoteDataSource(gh<_i821.EmergencyService>()),
    );
    gh.lazySingleton<_i198.ScanVehicleUseCase>(
      () => _i198.ScanVehicleUseCase(gh<_i723.ScanVehicleRepositoryDomain>()),
    );
    gh.lazySingleton<_i279.BaseChatBotRemoteDataSource>(
      () => _i279.ChatBotRemoteDataSource(
        gh<_i56.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i921.BaseAddExpenseRemoteDataSource>(
      () => _i921.AddExpenseRemoteDataSource(
        gh<_i56.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i641.ChatBotRepositoryDomain>(
      () =>
          _i810.ChatBotRepositoryData(gh<_i279.BaseChatBotRemoteDataSource>()),
    );
    gh.lazySingleton<_i403.ChatBotUseCase>(
      () => _i403.ChatBotUseCase(gh<_i641.ChatBotRepositoryDomain>()),
    );
    gh.lazySingleton<_i904.SosRepositoryDomain>(
      () => _i630.SosRepositoryData(gh<_i558.BaseSosRemoteDataSource>()),
    );
    gh.lazySingleton<_i68.BaseHomeRemoteDataSource>(
      () => _i68.HomeRemoteDataSource(
        gh<_i56.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i963.AddExpenseRepositoryDomain>(
      () => _i391.AddExpenseRepositoryData(
        gh<_i921.BaseAddExpenseRemoteDataSource>(),
        gh<_i737.VehicleLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i521.AddCarCardRepositoryDomain>(
      () => _i924.AddCarCardRepositoryData(
        gh<_i737.BaseAddCarCardRemoteDataSource>(),
        gh<_i737.VehicleLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i1057.AddExpenseUseCase>(
      () => _i1057.AddExpenseUseCase(gh<_i963.AddExpenseRepositoryDomain>()),
    );
    gh.lazySingleton<_i168.SosUseCase>(
      () => _i168.SosUseCase(gh<_i904.SosRepositoryDomain>()),
    );
    gh.lazySingleton<_i280.AddCarCardUseCase>(
      () => _i280.AddCarCardUseCase(gh<_i521.AddCarCardRepositoryDomain>()),
    );
    gh.lazySingleton<_i445.HomeRepositoryDomain>(
      () => _i248.HomeRepositoryData(gh<_i68.BaseHomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i463.HomeUseCase>(
      () => _i463.HomeUseCase(gh<_i445.HomeRepositoryDomain>()),
    );
    return this;
  }
}
