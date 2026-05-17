import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/features/parking/data/models/parking_model.dart';
import 'package:motrive/core/errors/network_exceptions.dart';

abstract class BaseParkingRemoteDataSource {
  Future<ParkingModel> getParking();
  Future<void> saveParkingLocation( { required String detectionMethod});
}

@LazySingleton(as: BaseParkingRemoteDataSource)
class ParkingRemoteDataSource implements BaseParkingRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;
  ParkingRemoteDataSource(this._supabase, this._userService);

  @override
  Future<ParkingModel> getParking() async {
    try {
      final response = await _supabase
          .from('parking_locations')
          .select()
          .eq('user_id', _userService.currentUser!.id)
          .order('parked_at', ascending: false)
          .limit(1)
         .maybeSingle();


    
    if (response == null) {
      throw Exception('No parking location found');
    }

    return ParkingModel.fromJson(response);
  } catch (error) {
    throw FailureExceptions.getException(error);
  }
}

  @override
  Future<void>saveParkingLocation({required String detectionMethod}) async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        throw Exception('Location service is disabled');
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        throw Exception(
          'User denied permissions to access the device location',
        );
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
          'Location permission is permanently denied. Enable it from settings.',
        );
      }

      final position = await Geolocator.getCurrentPosition();

      final placemark = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final place = placemark.first;

      final address = [
        place.street,
        place.locality,
        place.country,
      ].where((e) => e != null && e.isNotEmpty).join(', ');

      final vehicles = await _supabase
          .from('vehicles')
          .select('id')
          .eq('user_id', _userService.currentUser!.id)
          .limit(1);

      if (vehicles.isEmpty) {
        throw Exception('No vehicle found for this user');
      }

      final vehicleId = vehicles.first['id'];

      await _supabase.from('parking_locations').insert({
        'user_id': _userService.currentUser!.id,
        'vehicle_id': vehicleId,
        'latitudes': position.latitude,
        'longitude': position.longitude,
        'address': address.isEmpty ? 'Unknown location' : address,
        'detection_method': detectionMethod,
        'is_active': true,
 
      });

    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
