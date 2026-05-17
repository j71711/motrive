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
import 'package:motrive/features/expenses/data/datasources/expenses_remote_data_source.dart'
    as _i517;
import 'package:motrive/features/expenses/data/repositories/expenses_repository_data.dart'
    as _i653;
import 'package:motrive/features/expenses/domain/repositories/expenses_repository_domain.dart'
    as _i1034;
import 'package:motrive/features/expenses/domain/use_cases/expenses_use_case.dart'
    as _i564;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initExpenses({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i517.BaseExpensesRemoteDataSource>(
      () => _i517.ExpensesRemoteDataSource(
        gh<_i56.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i1034.ExpensesRepositoryDomain>(
      () => _i653.ExpensesRepositoryData(
        gh<_i517.BaseExpensesRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i564.ExpensesUseCase>(
      () => _i564.ExpensesUseCase(gh<_i1034.ExpensesRepositoryDomain>()),
    );
    return this;
  }
}
