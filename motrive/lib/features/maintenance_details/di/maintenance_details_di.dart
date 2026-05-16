import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'maintenance_details_di.config.dart'; 

@InjectableInit(
  initializerName: 'initMaintenanceDetails',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/maintenance_details'],
)
void configureMaintenanceDetails(GetIt getIt) {
  getIt.initMaintenanceDetails();
}
