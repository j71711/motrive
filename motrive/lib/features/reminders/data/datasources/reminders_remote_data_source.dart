import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:motrive/features/reminders/data/models/reminders_model.dart';

abstract class BaseRemindersRemoteDataSource {
  Future<List<RemindersModel>> getReminders();
}

@LazySingleton(as: BaseRemindersRemoteDataSource)
class RemindersRemoteDataSource implements BaseRemindersRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  RemindersRemoteDataSource(this._userService, this._supabase);

  @override
  Future<List<RemindersModel>> getReminders() async {
    final reminders = await _supabase
        .from('custom_reminders')
        .select()
        .eq('vehicle_id', _userService.currentVehicle!.id);

    return reminders.map((e) => RemindersModel.fromJson(e)).toList();
  }
}
