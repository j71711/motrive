import 'package:injectable/injectable.dart';
import 'package:motrive/core/errors/network_exceptions.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/parking/data/models/parking_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseParkingHistoryRemoteDataSource {
  Future<List<ParkingModel>> getParkingHistory();
}

@LazySingleton(as: BaseParkingHistoryRemoteDataSource)
class ParkingHistoryRemoteDataSource
    implements BaseParkingHistoryRemoteDataSource {
  final SupabaseClient _supabase;

  final UserService _userService;

  ParkingHistoryRemoteDataSource(this._supabase, this._userService);

  @override
  Future<List<ParkingModel>> getParkingHistory() async {
    try {
      final response = await _supabase
          .from('parking_locations')
          .select()
          .eq('user_id', _userService.currentUser!.id)
          .order('parked_at', ascending: false);
      print('PARKING HISTORY RESPONSE: $response');
      return response
          .map<ParkingModel>((e) => ParkingModel.fromJson(e))
          .toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
