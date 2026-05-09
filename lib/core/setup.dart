import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> setup() async {
  //----------------------------------------------------------------------------
  await dotenv.load(fileName: ".env");
  //----------------------------------------------------------------------------
  await Supabase.initialize(
    url: dotenv.env['url_supabase'].toString(),
    anonKey: dotenv.env['key_supabase'].toString(),
  );
  //----------------------------------------------------------------------------
  await GetStorage.init();
  //----------------------------------------------------------------------------
  await Hive.initFlutter();
  //----------------------------------------------------------------------------
  await Hive.openBox('vehicles_box');
  //----------------------------------------------------------------------------

    // await Future.wait([
    //   Hive.openBox('vehicles_box'),
    //   Hive.openBox('maintenance_box'),
    //   Hive.openBox('settings_box'),
    // ]);
}

