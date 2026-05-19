import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'vehicle_card_di.config.dart'; 

@InjectableInit(
  initializerName: 'initVehicleCardSub',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/sub/vehicle_card'],
)
void configureVehicleCardSub(GetIt getIt) {
  getIt.initVehicleCardSub();
}
