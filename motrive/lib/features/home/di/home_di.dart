import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'home_di.config.dart'; 

@InjectableInit(
  initializerName: 'initHome',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/home'],
)
void configureHome(GetIt getIt) {
  getIt.initHome();
}
