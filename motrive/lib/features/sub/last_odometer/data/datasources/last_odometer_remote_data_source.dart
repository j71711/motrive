import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/maintenance/data/models/vehicle/vehicle_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseLastOdometerRemoteDataSource {
  Stream<UserVehicleModel> getLastOdometer();
}

@LazySingleton(as: BaseLastOdometerRemoteDataSource)
class LastOdometerRemoteDataSource implements BaseLastOdometerRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  LastOdometerRemoteDataSource(this._userService, this._supabase);

  @override
  Stream<UserVehicleModel> getLastOdometer() {
    return _supabase
        .from('vehicles')
        .stream(primaryKey: ['id'])
        .eq('user_id', _userService.currentUser!.id)
        .map((event) => UserVehicleModel.fromJson(event.last));
  }
}
