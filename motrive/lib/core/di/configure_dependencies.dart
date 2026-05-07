import 'package:get_it/get_it.dart';
import 'package:motrive/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true,
  asExtension: true, 
  generateForDir: ['lib/core'],
)

Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  getIt.init();
}
