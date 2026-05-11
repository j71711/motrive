import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/core/services/local_keys_service.dart';
import 'package:motrive/features/home/sub/sos/data/models/sos_model.dart';
import 'package:motrive/core/errors/network_exceptions.dart';


abstract class BaseSosRemoteDataSource {
  Future<SosModel> getSos();
}


@LazySingleton(as: BaseSosRemoteDataSource)
class SosRemoteDataSource implements BaseSosRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   SosRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<SosModel> getSos() async {
    try {
      return SosModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
