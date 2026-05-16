import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'expenses_di.config.dart'; 

@InjectableInit(
  initializerName: 'initExpenses',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/expenses'],
)
void configureExpenses(GetIt getIt) {
  getIt.initExpenses();
}
