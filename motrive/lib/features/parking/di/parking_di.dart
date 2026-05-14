import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'parking_di.config.dart'; 

@InjectableInit(
  initializerName: 'initParking',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/parking'],
)
void configureParking(GetIt getIt) {
  getIt.initParking();
}
