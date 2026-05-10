import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {

  @lazySingleton
  Box get vehiclesBox =>
      Hive.box('vehicles_box');
}