import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/core/services/local_keys_service.dart';
import 'package:motrive/features/expenses/data/models/expenses_model.dart';
import 'package:motrive/core/errors/network_exceptions.dart';


abstract class BaseExpensesRemoteDataSource {
  Future<ExpensesModel> getExpenses();
}


@LazySingleton(as: BaseExpensesRemoteDataSource)
class ExpensesRemoteDataSource implements BaseExpensesRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   ExpensesRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<ExpensesModel> getExpenses() async {
    try {
      return ExpensesModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
