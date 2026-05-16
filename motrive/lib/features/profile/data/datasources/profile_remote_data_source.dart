import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/core/services/local_keys_service.dart';
import 'package:motrive/features/profile/data/models/profile_model.dart';
import 'package:motrive/core/errors/network_exceptions.dart';


abstract class BaseProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}


@LazySingleton(as: BaseProfileRemoteDataSource)
class ProfileRemoteDataSource implements BaseProfileRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   ProfileRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<ProfileModel> getProfile() async {
    try {
      return ProfileModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
