import 'package:injectable/injectable.dart';
import 'package:motrive/core/services/local_notification_service.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:motrive/features/sub/add_reminder/domain/entities/add_reminder_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseAddReminderRemoteDataSource {
  Future<void> getAddReminder(AddReminderEntity newReminder);
  Future<void> deleteReminder(String reminderId);
}

@LazySingleton(as: BaseAddReminderRemoteDataSource)
class AddReminderRemoteDataSource implements BaseAddReminderRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;
  final LocalNotificationService _localNotificationService;

  AddReminderRemoteDataSource(
    this._userService,
    this._supabase,
    this._localNotificationService,
  );

  @override
  Future<void> getAddReminder(AddReminderEntity newReminder) async {
    await _supabase.from('custom_reminders').upsert({
      if (newReminder.id != null) 'id': newReminder.id,
      'user_id': _userService.currentUser!.id,
      'vehicle_id': _userService.currentVehicle!.id,
      'title': newReminder.title,
      'category': newReminder.category,
      'trigger_type': newReminder.triggerType,
      'trigger_date': newReminder.triggerDate?.toIso8601String(),
      'trigger_odometer': newReminder.triggerOdometer,
      'odometer_advance_km': newReminder.odometerAdvanceKm,
      'date_advance_days': newReminder.dateAdvanceDays,
      'is_recurring': newReminder.isRecurring,
      'recurrence_unit': newReminder.recurrenceUnit,
      'recurrence_value': newReminder.recurrenceValue,
    });
    if (newReminder.isRecurring) {
      if (newReminder.triggerType == 'Odometer') {
      } else {
        Future<void> call;
        switch (newReminder.recurrenceUnit) {
          case 'day':
            call = _localNotificationService.scheduleCustomReminder(
              id: 10,
              carName: _userService.currentVehicle!.model,
              title: newReminder.title,
              scheduledDate: newReminder.triggerDate!,
              advanceDays: newReminder.recurrenceValue!,
            );
          case 'month':
            call = _localNotificationService.scheduleMonthlyReminder(
              id: 10,
              carName: _userService.currentVehicle!.model,
              title: newReminder.title,
              firstFireDate: newReminder.triggerDate!,
              repeatCount: newReminder.recurrenceValue,
            );
          case 'year':
            call = _localNotificationService.scheduleYearlyReminder(
              id: 10,
              carName: _userService.currentVehicle!.model,
              title: newReminder.title,
              firstFireDate: newReminder.triggerDate!,
              repeatCount: newReminder.recurrenceValue,
            );
          default:
            call = Future<void>(() {});
        }
        await call;
      }
    } else {
      if (newReminder.triggerType == 'Odometer') {
        await _localNotificationService.customReminderOdometerNotification(
          title: newReminder.title,
          carName: _userService.currentVehicle!.model,
          kmRemaining:
              newReminder.triggerOdometer! -
              (_userService.currentVehicle!.currentOdometer ?? 0),
        );
      } else {
        await _localNotificationService.customReminderUpcomingNotification(
          title: newReminder.title,
          carName: _userService.currentVehicle!.model,
          daysLeft: newReminder.triggerDate!.difference(DateTime.now()).inDays,
        );
      }
    }
  }

  @override
  Future<void> deleteReminder(String reminderId) async {
    await _supabase.from('custom_reminders').delete().eq('id', reminderId);
  }
}
