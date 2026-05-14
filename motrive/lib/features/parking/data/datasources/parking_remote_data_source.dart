import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/features/parking/data/models/parking_model.dart';
import 'package:motrive/core/errors/network_exceptions.dart';

abstract class BaseParkingRemoteDataSource {
  Future<ParkingModel> getParking();
  Future<void> saveParkingLocation();
}

@LazySingleton(as: BaseParkingRemoteDataSource)
class ParkingRemoteDataSource
    implements BaseParkingRemoteDataSource {
  final SupabaseClient _supabase;

  ParkingRemoteDataSource(this._supabase);

  @override
  Future<ParkingModel> getParking() async {
    try {
      final user = _supabase.auth.currentUser;

      if (user == null) {
        throw Exception('User not found');
      }

      final response = await _supabase
          .from('parking_locations')
          .select()
          .eq('user_id', user.id)
          .eq('is_active', true)
          .order('parked_at', ascending: false)
          .limit(1)
          .single();

      return ParkingModel.fromJson(response);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> saveParkingLocation() async {
    try {
      final position =
          await Geolocator.getCurrentPosition();

      final user = _supabase.auth.currentUser;

      if (user == null) {
        throw Exception('User not found');
      }

      await _supabase
          .from('parking_locations')
          .insert({
            'user_id': user.id,
            'vehicle_id': null,
            'latitudes': position.latitude,
            'longitude': position.longitude,
            'address': null,
            'notes': 'Auto detected parking',
            'detection_method':
                'activity_recognition',
            'is_active': true,
            'parked_at':
                DateTime.now().toIso8601String(),
          });

      print('Parking location saved');
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}