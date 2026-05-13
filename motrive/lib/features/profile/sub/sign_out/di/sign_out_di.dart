import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'sign_out_di.config.dart'; 

@InjectableInit(
  initializerName: 'initSignOutSub',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/sub/sign_out'],
)
void configureSignOutSub(GetIt getIt) {
  getIt.initSignOutSub();
}
