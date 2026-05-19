import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'add_reminder_di.config.dart'; 

@InjectableInit(
  initializerName: 'initAddReminderSub',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/sub/add_reminder'],
)
void configureAddReminderSub(GetIt getIt) {
  getIt.initAddReminderSub();
}
