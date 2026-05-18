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
import 'package:motrive/features/profile/data/datasources/profile_remote_data_source.dart'
    as _i319;
import 'package:motrive/features/profile/data/repositories/profile_repository_data.dart'
    as _i738;
import 'package:motrive/features/profile/domain/repositories/profile_repository_domain.dart'
    as _i217;
import 'package:motrive/features/profile/domain/use_cases/profile_use_case.dart'
    as _i950;
import 'package:motrive/features/profile/sub/emergency_contact/data/datasources/emergency_contact_remote_data_source.dart'
    as _i389;
import 'package:motrive/features/profile/sub/emergency_contact/data/repositories/emergency_contact_repository_data.dart'
    as _i859;
import 'package:motrive/features/profile/sub/emergency_contact/domain/repositories/emergency_contact_repository_domain.dart'
    as _i883;
import 'package:motrive/features/profile/sub/emergency_contact/domain/use_cases/emergency_contact_use_case.dart'
    as _i276;
import 'package:motrive/features/profile/sub/sign_out/data/datasources/sign_out_remote_data_source.dart'
    as _i524;
import 'package:motrive/features/profile/sub/sign_out/data/repositories/sign_out_repository_data.dart'
    as _i24;
import 'package:motrive/features/profile/sub/sign_out/domain/repositories/sign_out_repository_domain.dart'
    as _i115;
import 'package:motrive/features/profile/sub/sign_out/domain/use_cases/sign_out_use_case.dart'
    as _i261;
import 'package:motrive/features/profile/sub/user/data/datasources/user_remote_data_source.dart'
    as _i764;
import 'package:motrive/features/profile/sub/user/data/repositories/user_repository_data.dart'
    as _i988;
import 'package:motrive/features/profile/sub/user/domain/repositories/user_repository_domain.dart'
    as _i569;
import 'package:motrive/features/profile/sub/user/domain/use_cases/user_use_case.dart'
    as _i977;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initProfile({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i389.BaseEmergencyContactRemoteDataSource>(
      () => _i389.EmergencyContactRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i524.BaseSignOutRemoteDataSource>(
      () => _i524.SignOutRemoteDataSource(
        gh<_i1013.UserService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i319.BaseProfileRemoteDataSource>(
      () => _i319.ProfileRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1013.UserService>(),
      ),
    );
    gh.lazySingleton<_i883.EmergencyContactRepositoryDomain>(
      () => _i859.EmergencyContactRepositoryData(
        gh<_i389.BaseEmergencyContactRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i217.ProfileRepositoryDomain>(
      () =>
          _i738.ProfileRepositoryData(gh<_i319.BaseProfileRemoteDataSource>()),
    );
    gh.lazySingleton<_i276.EmergencyContactUseCase>(
      () => _i276.EmergencyContactUseCase(
        gh<_i883.EmergencyContactRepositoryDomain>(),
      ),
    );
    gh.lazySingleton<_i115.SignOutRepositoryDomain>(
      () => _i24.SignOutRepositoryData(gh<_i524.BaseSignOutRemoteDataSource>()),
    );
    gh.lazySingleton<_i950.ProfileUseCase>(
      () => _i950.ProfileUseCase(gh<_i217.ProfileRepositoryDomain>()),
    );
    gh.lazySingleton<_i764.BaseUserRemoteDataSource>(
      () => _i764.UserRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i1013.UserService>(),
      ),
    );
    gh.lazySingleton<_i569.UserRepositoryDomain>(
      () => _i988.UserRepositoryData(gh<_i764.BaseUserRemoteDataSource>()),
    );
    gh.lazySingleton<_i977.UserUseCase>(
      () => _i977.UserUseCase(gh<_i569.UserRepositoryDomain>()),
    );
    gh.lazySingleton<_i261.SignOutUseCase>(
      () => _i261.SignOutUseCase(gh<_i115.SignOutRepositoryDomain>()),
    );
    return this;
  }
}
