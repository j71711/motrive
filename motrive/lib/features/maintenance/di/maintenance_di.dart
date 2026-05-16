import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'maintenance_di.config.dart'; 

@InjectableInit(
  initializerName: 'initMaintenance',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/maintenance'],
)
void configureMaintenance(GetIt getIt) {
  getIt.initMaintenance();
}
