import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/maintenance/data/models/vehicle/vehicle_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseVehicleCardRemoteDataSource {
  Future<UserVehicleModel> getVehicleCard();
}

@LazySingleton(as: BaseVehicleCardRemoteDataSource)
class VehicleCardRemoteDataSource implements BaseVehicleCardRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  VehicleCardRemoteDataSource(this._supabase, this._userService);

  @override
  Future<UserVehicleModel> getVehicleCard() async {
    final response = await _supabase
        .from('vehicles')
        .select()
        .eq('user_id', _userService.currentUser!.id)
        .order('created_at');
    return UserVehicleModel.fromJson(response.first);
  }
}
