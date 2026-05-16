import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:motrive/core/config/env.dart';

// import 'package:motrive/core/config/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> setup() async {
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
  await Supabase.initialize(url: Env.urlSupabase, anonKey: Env.keySupabase);
  //----------------------------------------------------------------------------
  //----------------------------------------------------------------------------
  await GoogleSignIn.instance.initialize(
  clientId: Env.iosClientId,
  serverClientId: Env.webClientId,
);
}

