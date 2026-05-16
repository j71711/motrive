import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'profile_di.config.dart'; 

@InjectableInit(
  initializerName: 'initProfile',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/profile'],
)
void configureProfile(GetIt getIt) {
  getIt.initProfile();
}
