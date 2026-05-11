import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/emergency_service.dart';
import 'package:motrive/features/home/sub/sos/data/models/sos_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseSosRemoteDataSource {
  Future<List<SosModel>> getSos();

Future<void> sendSosEmail({
  required String email,
});

  Future<void> callPolice();

  Future<void> callAmbulance();
}

@LazySingleton(as: BaseSosRemoteDataSource)
class SosRemoteDataSource implements BaseSosRemoteDataSource {
  final EmergencyService emergencyService;
  final SupabaseClient supabase;

  SosRemoteDataSource(this.emergencyService, this.supabase);

  @override
  Future<List<SosModel>> getSos() async {
    final response = await supabase
        .from('emergency_events')
        .select()
        .order('triggered_at', ascending: false);

    return response.map((json) => SosModel.fromJson(json)).toList();
  }

  @override
  Future<void> sendSosEmail({required String email}) async {
    emergencyService.sendSosEmailFromSupabase(email: email);
  }

  @override
  Future<void> callPolice() async {
    await emergencyService.callPolice();
  }

  @override
  Future<void> callAmbulance() async {
    await emergencyService.callAmbulance();
  }
}
