import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'reminders_di.config.dart'; 

@InjectableInit(
  initializerName: 'initReminders',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/reminders'],
)
void configureReminders(GetIt getIt) {
  getIt.initReminders();
}
