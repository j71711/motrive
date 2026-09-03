import 'package:injectable/injectable.dart';
import 'package:motrive/features/profile/sub/emergency_contact/data/models/emergency_contact_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseEmergencyContactRemoteDataSource {
  Future<List<EmergencyContactModel>> getEmergencyContact();

  Future<void> addEmergencyContact({
    required String name,
    required String phoneNumber,
    required String relation,
    required bool notifyEmergency,
  });

  Future<void> updateEmergencyContact({
    required String id,
    required String name,
    required String phoneNumber,
    required String relation,
    required bool notifyEmergency,
  });

  Future<void> deleteEmergencyContact({required String id});
}

@LazySingleton(as: BaseEmergencyContactRemoteDataSource)
class EmergencyContactRemoteDataSource
    implements BaseEmergencyContactRemoteDataSource {
  final SupabaseClient _supabase;

  EmergencyContactRemoteDataSource(this._supabase);

  Future<String> _getAppUserId() async {
    final authId = _supabase.auth.currentUser!.id;

    final appUser = await _supabase
        .from('users')
        .select('id')
        .eq('auth_id', authId)
        .single();

    return appUser['id'];
  }

  @override
  Future<List<EmergencyContactModel>> getEmergencyContact() async {
    final userId = await _getAppUserId();

    final response = await _supabase
        .from('trusted_contacts')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: false);

    return response
        .map<EmergencyContactModel>(
          (json) => EmergencyContactModel.fromJson(json),
        )
        .toList();
  }

  @override
  Future<void> addEmergencyContact({
    required String name,
    required String phoneNumber,
    required String relation,
    required bool notifyEmergency,
  }) async {
    final userId = await _getAppUserId();

    await _supabase.from('trusted_contacts').insert({
      'user_id': userId,
      'name': name,
      'phone_number': phoneNumber,
      'relation': relation,
      'notify_emergency': notifyEmergency,
    });
  }

  @override
  Future<void> updateEmergencyContact({
    required String id,
    required String name,
    required String phoneNumber,
    required String relation,
    required bool notifyEmergency,
  }) async {
    await _supabase
        .from('trusted_contacts')
        .update({
          'name': name,
          'phone_number': phoneNumber,
          'relation': relation,
          'notify_emergency': notifyEmergency,
        })
        .eq('id', id);
  }

  @override
  Future<void> deleteEmergencyContact({required String id}) async {
    await _supabase.from('trusted_contacts').delete().eq('id', id);
  }
}
