import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:motrive/core/di/configure_dependencies.config.dart';
import 'package:motrive/features/add_vehicle/di/add_vehicle_di.dart';
import 'package:motrive/features/auth/di/auth_di.dart';
import 'package:motrive/features/expenses/di/expenses_di.dart';
import 'package:motrive/features/home/di/home_di.dart';
import 'package:motrive/features/profile/di/profile_di.dart';
import 'package:motrive/features/maintenance/di/maintenance_di.dart';
import 'package:motrive/features/maintenance_details/di/maintenance_details_di.dart';
import 'package:motrive/features/sub/save_service/di/save_service_di.dart';
import 'package:motrive/features/loading/di/loading_di.dart';
import 'package:motrive/features/parking/di/parking_di.dart';
import 'package:motrive/features/sub/maintenance_alert/di/maintenance_alert_di.dart';
import 'package:motrive/features/sub/vehicle_card/di/vehicle_card_di.dart';
import 'package:motrive/features/reminders/di/reminders_di.dart';
import 'package:motrive/features/sub/add_reminder/di/add_reminder_di.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
  generateForDir: ['lib/core'],
)
Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  getIt.init();
  configureAuth(getIt);
  configureHome(getIt);
  configureProfile(getIt);
  configureMaintenance(getIt);
  configureMaintenanceDetails(getIt);
  configureSaveServiceSub(getIt);
  configureLoading(getIt);
  configureParking(getIt);
  configureMaintenanceAlertSub(getIt);
  configureVehicleCardSub(getIt);
  configureExpenses(getIt);
  configureReminders(getIt);
  configureAddReminderSub(getIt);
  configureAddVehicle(getIt);
}
