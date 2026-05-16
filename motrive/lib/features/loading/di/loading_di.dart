import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'loading_di.config.dart'; 

@InjectableInit(
  initializerName: 'initLoading',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/loading'],
)
void configureLoading(GetIt getIt) {
  getIt.initLoading();
}
