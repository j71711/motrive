import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/core/services/local_keys_service.dart';
import 'package:motrive/features/home0/sub/add_car_card/data/models/add_car_card_model.dart';
import 'package:motrive/core/errors/network_exceptions.dart';


abstract class BaseAddCarCardRemoteDataSource {
  Future<AddCarCardModel> getAddCarCard();
}


@LazySingleton(as: BaseAddCarCardRemoteDataSource)
class AddCarCardRemoteDataSource implements BaseAddCarCardRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   AddCarCardRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<AddCarCardModel> getAddCarCard() async {
    try {
      return AddCarCardModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
