import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'home0_di.config.dart'; 

@InjectableInit(
  initializerName: 'initHome0',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/home0'],
)
void configureHome0(GetIt getIt) {
  getIt.initHome0();
}
