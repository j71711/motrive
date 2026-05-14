import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'maintenance_alert_di.config.dart'; 

@InjectableInit(
  initializerName: 'initMaintenanceAlertSub',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/sub/maintenance_alert'],
)
void configureMaintenanceAlertSub(GetIt getIt) {
  getIt.initMaintenanceAlertSub();
}
