import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'last_odometer_di.config.dart'; 

@InjectableInit(
  initializerName: 'initLastOdometerSub',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/sub/last_odometer'],
)
void configureLastOdometerSub(GetIt getIt) {
  getIt.initLastOdometerSub();
}
