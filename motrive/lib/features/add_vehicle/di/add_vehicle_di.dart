import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'add_vehicle_di.config.dart'; 

@InjectableInit(
  initializerName: 'initAddVehicle',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/add_vehicle'],
)
void configureAddVehicle(GetIt getIt) {
  getIt.initAddVehicle();
}
