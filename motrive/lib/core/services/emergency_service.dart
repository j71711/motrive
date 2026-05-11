import 'package:geolocator/geolocator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyService {
    final SupabaseClient _supabase =
      Supabase.instance.client;

  Future<void> callPolice() async {
    await _callNumber('999');
  }

  Future<void> callAmbulance() async {
    await _callNumber('997');
  }

  Future<void> _callNumber(String number) async {
    final uri = Uri.parse('tel:$number');

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }


  Future<void> sendSosEmailFromSupabase(  {required String email}) async {
    final position = await _getLocation();

    final response = await _supabase.functions.invoke(
      'send-sos-email',
      body: {
        'latitude': position.latitude,
        'longitude': position.longitude,
      },
    );

    print(response.data);
  }

Future<Position> _getLocation() async {
    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw Exception('Location permission denied');
    }

    return Geolocator.getCurrentPosition();
  }
}