import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/core/services/local_keys_service.dart';
import 'package:motrive/features/home/sub/add_expense/data/models/add_expense_model.dart';
import 'package:motrive/core/errors/network_exceptions.dart';

abstract class BaseAddExpenseRemoteDataSource {
  Future<void> addExpense(AddExpenseModel model);
}

@LazySingleton(as: BaseAddExpenseRemoteDataSource)
class AddExpenseRemoteDataSource implements BaseAddExpenseRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  AddExpenseRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<void> addExpense(AddExpenseModel model) async {
    try {
      final user = _supabase.auth.currentUser;
if (user == null) {
  throw Exception('User not authenticated');
}
else{
  final userId = _supabase.auth.currentUser!.id;
     await _supabase.from('expense_records').insert({
        ...model.toJson(),
        'vehicle_id': model.vehicleId,
        'user_id': userId,
      });
}
      
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
