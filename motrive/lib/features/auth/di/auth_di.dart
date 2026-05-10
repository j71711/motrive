import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'auth_di.config.dart'; 

@InjectableInit(
  initializerName: 'initAuth',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/auth'],
)
void configureAuth(GetIt getIt) {
  getIt.initAuth();
}
