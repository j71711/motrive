import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

@lazySingleton
class LocalNotificationService {
  final FlutterLocalNotificationsPlugin _plugin;

  const LocalNotificationService(this._plugin);

  // ─── Channels ────────────────────────────────────────────────

  static const _maintenanceChannel = AndroidNotificationDetails(
    'maintenance_channel_id',
    'Maintenance Reminders',
    channelDescription: 'Scheduled vehicle maintenance alerts',
    importance: Importance.max,
    priority: Priority.high,
    playSound: true,
    icon: '@mipmap/ic_launcher',
  );

  static const _emergencyChannel = AndroidNotificationDetails(
    'emergency_channel_id',
    'Emergency Alerts',
    channelDescription: 'SOS and emergency event notifications',
    importance: Importance.max,
    priority: Priority.max,
    playSound: true,
    fullScreenIntent: true,
    icon: '@mipmap/ic_launcher',
  );

  static const _parkingChannel = AndroidNotificationDetails(
    'parking_channel_id',
    'Parking',
    channelDescription: 'Vehicle parking location alerts',
    importance: Importance.defaultImportance,
    priority: Priority.defaultPriority,
    playSound: true,
    icon: '@mipmap/ic_launcher',
  );

  static const _expenseChannel = AndroidNotificationDetails(
    'expense_channel_id',
    'Expenses',
    channelDescription: 'Vehicle expense and cost alerts',
    importance: Importance.defaultImportance,
    priority: Priority.defaultPriority,
    icon: '@mipmap/ic_launcher',
  );

  static const _vehicleChannel = AndroidNotificationDetails(
    'vehicle_channel_id',
    'Vehicle Updates',
    channelDescription: 'Vehicle profile and manual updates',
    importance: Importance.defaultImportance,
    priority: Priority.defaultPriority,
    icon: '@mipmap/ic_launcher',
  );

  static const _reminderChannel = AndroidNotificationDetails(
    'reminder_channel_id',
    'Custom Reminders',
    channelDescription: 'Your custom vehicle reminders',
    importance: Importance.high,
    priority: Priority.high,
    playSound: true,
    icon: '@mipmap/ic_launcher',
  );

  static const _iosDetails = DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  // ════════════════════════════════════════════════════════════
  // INSTANT NOTIFICATIONS
  // ════════════════════════════════════════════════════════════

  // ─── Welcome ─────────────────────────────────────────────────

  Future<void> welcomeNotification(String name) async {
    await _show(
      id: 1,
      title: '👋 Welcome, $name!',
      body: 'Motrive is ready. Add your vehicle to get started.',
      android: _vehicleChannel,
    );
  }

  // ─── Maintenance ─────────────────────────────────────────────

  Future<void> maintenanceDueSoonNotification({
    required String carName,
    required String serviceType,
    required int kmRemaining,
  }) async {
    await _show(
      id: 100,
      title: '🔧 Maintenance Due Soon',
      body: '$carName — $serviceType due in $kmRemaining km.',
      android: _maintenanceChannel,
    );
  }

  Future<void> maintenanceOverdueNotification({
    required String carName,
    required String serviceType,
  }) async {
    await _show(
      id: 101,
      title: '⚠️ Maintenance Overdue',
      body: '$carName — $serviceType is overdue. Visit a service center.',
      android: _maintenanceChannel,
    );
  }

  Future<void> maintenanceCompletedNotification({
    required String carName,
    required String serviceType,
  }) async {
    await _show(
      id: 102,
      title: '✅ Service Completed',
      body: '$serviceType logged for $carName. Next interval recorded.',
      android: _maintenanceChannel,
    );
  }

  Future<void> oilChangeReminderNotification({
    required String carName,
    required int dueDateKm,
  }) async {
    await _show(
      id: 103,
      title: '🛢️ Oil Change Reminder',
      body: '$carName oil change due at $dueDateKm km.',
      android: _maintenanceChannel,
    );
  }

  Future<void> manualParsedNotification({
    required String carName,
    required int servicesFound,
  }) async {
    await _show(
      id: 104,
      title: '📋 Manual Processed',
      body:
          '$carName manual scanned — $servicesFound maintenance '
          'service${servicesFound > 1 ? 's' : ''} loaded.',
      android: _vehicleChannel,
    );
  }

  Future<void> manualParseFailedNotification(String carName) async {
    await _show(
      id: 105,
      title: '❌ Manual Upload Failed',
      body:
          'Could not read the manual for $carName. '
          'Try uploading again or use a different file.',
      android: _vehicleChannel,
    );
  }

  // ─── Custom Reminders ─────────────────────────────────────────

  Future<void> customReminderDueNotification({
    required String title,
    required String carName,
  }) async {
    await _show(
      id: 200,
      title: '🔔 Reminder: $title',
      body: '$carName — $title is due today.',
      android: _reminderChannel,
    );
  }

  Future<void> customReminderUpcomingNotification({
    required String title,
    required String carName,
    required int daysLeft,
  }) async {
    await _show(
      id: 201,
      title: '📅 Upcoming: $title',
      body:
          '$carName — $title is due in $daysLeft day${daysLeft > 1 ? 's' : ''}.',
      android: _reminderChannel,
    );
  }

  Future<void> customReminderOdometerNotification({
    required String title,
    required String carName,
    required int kmRemaining,
  }) async {
    await _show(
      id: 202,
      title: '🛣️ Reminder: $title',
      body: '$carName — $title due in $kmRemaining km.',
      android: _reminderChannel,
    );
  }

  // ─── Parking ──────────────────────────────────────────────────

  Future<void> parkingLocationSavedNotification(String address) async {
    await _show(
      id: 300,
      title: '📍 Parking Saved',
      body: 'Your car location has been saved at $address.',
      android: _parkingChannel,
    );
  }

  Future<void> parkingSessionEndedNotification(String duration) async {
    await _show(
      id: 301,
      title: '🚗 Back on the Road',
      body: 'Parking session ended. You were parked for $duration.',
      android: _parkingChannel,
    );
  }

  Future<void> findMyCarNotification(String address) async {
    await _show(
      id: 302,
      title: '🔍 Your Car is Parked Here',
      body: address,
      android: _parkingChannel,
    );
  }

  // ─── Emergency ────────────────────────────────────────────────

  Future<void> emergencyTriggeredNotification() async {
    await _show(
      id: 400,
      title: '🚨 SOS Activated',
      body: 'Emergency alert sent to your trusted contacts.',
      android: _emergencyChannel,
    );
  }

  Future<void> emergencyContactNotifiedNotification(String contactName) async {
    await _show(
      id: 401,
      title: '📲 Contact Notified',
      body: '$contactName has been alerted with your location.',
      android: _emergencyChannel,
    );
  }

  Future<void> emergencyResolvedNotification() async {
    await _show(
      id: 402,
      title: '✅ Emergency Resolved',
      body: 'Your SOS alert has been marked as resolved.',
      android: _emergencyChannel,
    );
  }

  // ─── Expenses ─────────────────────────────────────────────────

  Future<void> expenseLoggedNotification({
    required String carName,
    required String category,
    required String amount,
  }) async {
    await _show(
      id: 500,
      title: '💰 Expense Logged',
      body: '$carName — $category recorded for $amount.',
      android: _expenseChannel,
    );
  }

  Future<void> monthlyExpenseSummaryNotification({
    required String carName,
    required String totalAmount,
    required String month,
  }) async {
    await _show(
      id: 501,
      title: '📊 Monthly Summary',
      body: '$carName total expenses for $month: $totalAmount.',
      android: _expenseChannel,
    );
  }

  // ─── Vehicle ──────────────────────────────────────────────────

  Future<void> vehicleAddedNotification(String carName) async {
    await _show(
      id: 600,
      title: '🚘 Vehicle Added',
      body: '$carName has been added to your garage.',
      android: _vehicleChannel,
    );
  }

  Future<void> odometerUpdatedNotification({
    required String carName,
    required int odometer,
  }) async {
    await _show(
      id: 601,
      title: '🔢 Odometer Updated',
      body: '$carName — current reading: $odometer km.',
      android: _vehicleChannel,
    );
  }

  // ════════════════════════════════════════════════════════════
  // SCHEDULED NOTIFICATIONS
  // ════════════════════════════════════════════════════════════
  //
  // ID ranges for scheduled:
  //   1000–1999  Maintenance schedule
  //   2000–2999  Custom reminders
  //   3000–3999  Parking timeout
  //   4000–4999  Expense monthly summary
  //
  // Call tz.initializeTimeZones() once in main() before using these.

  // ─── Maintenance Scheduled ────────────────────────────────────

  /// Schedule a reminder N days before a maintenance due date.
  /// [id] should be unique per service — use the oem_maintenance_item id hash.
  Future<void> scheduleMaintenanceDueSoon({
    required int id,
    required String carName,
    required String serviceType,
    required DateTime dueDate,
    int daysBefore = 7,
  }) async {
    final scheduleDate = dueDate.subtract(Duration(days: daysBefore));
    if (scheduleDate.isBefore(DateTime.now())) return;

    await _schedule(
      id: 1000 + id,
      title: '🔧 Service Due in $daysBefore Days',
      body:
          '$carName — $serviceType due on '
          '${_formatDate(dueDate)}.',
      scheduledDate: scheduleDate,
      android: _maintenanceChannel,
    );
  }

  /// Schedule the overdue alert for exactly on the due date.
  Future<void> scheduleMaintenanceOnDueDate({
    required int id,
    required String carName,
    required String serviceType,
    required DateTime dueDate,
  }) async {
    if (dueDate.isBefore(DateTime.now())) return;

    await _schedule(
      id: 1500 + id,
      title: '⚠️ Service Due Today',
      body: '$carName — $serviceType is due today. Don\'t delay!',
      scheduledDate: dueDate,
      android: _maintenanceChannel,
    );
  }

  /// Schedule a repeating annual service reminder (e.g. insurance, registration).
  Future<void> scheduleYearlyMaintenanceReminder({
    required int id,
    required String carName,
    required String serviceType,
    required DateTime firstDueDate,
  }) async {
    if (firstDueDate.isBefore(DateTime.now())) return;

    await _scheduleRepeating(
      id: 1800 + id,
      title: '📅 Annual Service: $serviceType',
      body: '$carName — $serviceType is due this year.',
      scheduledDate: firstDueDate,
      repeatInterval: RepeatInterval.yearly, // ← uses yearly repeat
      android: _maintenanceChannel,
    );
  }

  // ─── Custom Reminders Scheduled ───────────────────────────────

  /// Schedule a one-time custom reminder on a specific date/time.
  Future<void> scheduleCustomReminder({
    required int id,
    required String carName,
    required String title,
    required DateTime scheduledDate,
    int advanceDays = 0,
  }) async {
    final fireDate = advanceDays > 0
        ? scheduledDate.subtract(Duration(days: advanceDays))
        : scheduledDate;

    if (fireDate.isBefore(DateTime.now())) return;

    await _schedule(
      id: 2000 + id,
      title: '🔔 $title',
      body: '$carName — $title reminder.',
      scheduledDate: fireDate,
      android: _reminderChannel,
    );
  }

  /// Schedule a repeating weekly reminder (e.g. check tyre pressure every week).
  Future<void> scheduleWeeklyReminder({
    required int id,
    required String carName,
    required String title,
    required DateTime firstFireDate,
  }) async {
    if (firstFireDate.isBefore(DateTime.now())) return;

    await _scheduleRepeating(
      id: 2500 + id,
      title: '🔁 $title',
      body: '$carName — $title weekly check.',
      scheduledDate: firstFireDate,
      repeatInterval: RepeatInterval.weekly,
      android: _reminderChannel,
    );
  }

  /// Schedule a repeating monthly reminder (e.g. check fluid levels).
  Future<void> scheduleMonthlyReminder({
    required int id,
    required String carName,
    required String title,
    required DateTime firstFireDate,
  }) async {
    if (firstFireDate.isBefore(DateTime.now())) return;

    await _scheduleRepeating(
      id: 2800 + id,
      title: '📆 $title',
      body: '$carName — $title monthly check.',
      scheduledDate: firstFireDate,
      repeatInterval: RepeatInterval.monthly, // ← uses monthly repeat
      android: _reminderChannel,
    );
  }

  // ─── Parking Timeout Scheduled ────────────────────────────────

  /// Fires after [hours] hours to remind the user their car is still parked.
  Future<void> scheduleParkingTimeout({
    required String address,
    int hours = 24,
  }) async {
    final fireDate = DateTime.now().add(Duration(hours: hours));

    await _schedule(
      id: 3000,
      title: '🅿️ Car Still Parked',
      body: 'Your car has been parked at $address for $hours hours.',
      scheduledDate: fireDate,
      android: _parkingChannel,
    );
  }

  /// Cancel the parking timeout (call when the user retrieves the car).
  Future<void> cancelParkingTimeout() async {
    await _plugin.cancel(id: 3000);
  }

  // ─── Expense Monthly Summary Scheduled ────────────────────────

  /// Schedule a recurring monthly expense summary on a fixed day of month.
  /// Fires every month on [dayOfMonth] at 09:00.
  Future<void> scheduleMonthlyExpenseSummary({
    required String carName,
    int dayOfMonth = 1,
  }) async {
    // Build next occurrence of dayOfMonth at 09:00
    final now = DateTime.now();
    var next = DateTime(now.year, now.month, dayOfMonth, 9, 0);
    if (next.isBefore(now)) {
      next = DateTime(now.year, now.month + 1, dayOfMonth, 9, 0);
    }

    await _scheduleRepeating(
      id: 4000,
      title: '📊 Monthly Car Expenses',
      body: 'Your $carName expense summary is ready. Tap to review.',
      scheduledDate: next,
      repeatInterval: RepeatInterval.monthly,
      android: _expenseChannel,
    );
  }

  // ─── Cancel Helpers ───────────────────────────────────────────

  /// Cancel a single scheduled notification by its logical id + range offset.
  Future<void> cancelMaintenanceSchedule(int id) async {
    await _plugin.cancel(id: 1000 + id);
    await _plugin.cancel(id: 1500 + id); // also cancel the on-due-date variant
  }

  Future<void> cancelCustomReminder(int id) async {
    await _plugin.cancel(id: 2000 + id);
    await _plugin.cancel(id: 2500 + id);
    await _plugin.cancel(id: 2800 + id);
  }

  /// Cancel every pending notification.
  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }

  /// Returns all currently pending scheduled notifications.
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return _plugin.pendingNotificationRequests();
  }

  // ════════════════════════════════════════════════════════════
  // PRIVATE HELPERS
  // ════════════════════════════════════════════════════════════

  /// Fire immediately.
  Future<void> _show({
    required int id,
    required String title,
    required String body,
    required AndroidNotificationDetails android,
  }) async {
    await _plugin
        .show(
          id: id,
          title: title,
          body: body,
          notificationDetails: NotificationDetails(
            android: android,
            iOS: _iosDetails,
          ),
        )
        .onError((error, stackTrace) => log(error.toString()));
  }

  /// Fire once at a specific date/time.
  Future<void> _schedule({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required AndroidNotificationDetails android,
  }) async {
    await _plugin
        .zonedSchedule(
          id: id,
          title: title,
          body: body,
          scheduledDate: tz.TZDateTime.from(scheduledDate, tz.local),
          notificationDetails: NotificationDetails(
            android: android,
            iOS: _iosDetails,
          ),
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        )
        .onError((error, stackTrace) => log(error.toString()));
  }

  /// Fire repeatedly on a fixed interval (daily / weekly / monthly / yearly).
  Future<void> _scheduleRepeating({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    required RepeatInterval repeatInterval,
    required AndroidNotificationDetails android,
  }) async {
    await _plugin
        .periodicallyShowWithDuration(
          id: id,
          title: title,
          body: body,
          repeatDurationInterval: _repeatIntervalToDuration(repeatInterval),
          notificationDetails: NotificationDetails(
            android: android,
            iOS: _iosDetails,
          ),
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        )
        .onError((error, stackTrace) => log(error.toString()));
  }

  /// Map RepeatInterval enum to Duration for periodicallyShowWithDuration.
  Duration _repeatIntervalToDuration(RepeatInterval interval) {
    return switch (interval) {
      RepeatInterval.everyMinute => const Duration(minutes: 1),
      RepeatInterval.hourly => const Duration(hours: 1),
      RepeatInterval.daily => const Duration(days: 1),
      RepeatInterval.weekly => const Duration(days: 7),
      RepeatInterval.monthly => const Duration(days: 30),
      RepeatInterval.yearly => const Duration(days: 365),
      _ => const Duration(days: 1),
    };
  }

  String _formatDate(DateTime date) => '${date.day}/${date.month}/${date.year}';
}

// ─── RepeatInterval extension ─────────────────────────────────
// Add monthly/yearly since the package only ships daily/weekly natively.
enum RepeatInterval { everyMinute, hourly, daily, weekly, monthly, yearly }
