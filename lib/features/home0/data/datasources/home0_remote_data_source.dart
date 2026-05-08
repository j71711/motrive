import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/core/services/local_keys_service.dart';
import 'package:motrive/features/home0/data/models/home0_model.dart';
import 'package:motrive/core/errors/network_exceptions.dart';


abstract class BaseHome0RemoteDataSource {
  Future<Home0Model> getHome0();
}


@LazySingleton(as: BaseHome0RemoteDataSource)
class Home0RemoteDataSource implements BaseHome0RemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   Home0RemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<Home0Model> getHome0() async {
    try {
      return Home0Model(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
