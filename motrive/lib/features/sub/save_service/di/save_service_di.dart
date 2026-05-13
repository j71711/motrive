import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'save_service_di.config.dart'; 

@InjectableInit(
  initializerName: 'initSaveServiceSub',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/sub/save_service'],
)
void configureSaveServiceSub(GetIt getIt) {
  getIt.initSaveServiceSub();
}
