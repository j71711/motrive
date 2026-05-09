
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:motrive/core/config/env.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> setup() async {
  //----------------------------------------------------------------------------
  await Supabase.initialize(url: Env.urlSupabase, anonKey: Env.keySupabase);
  //----------------------------------------------------------------------------
  await GetStorage.init();
  //----------------------------------------------------------------------------

  await GoogleSignIn.instance.initialize(
  clientId: Env.iosClientId,
  serverClientId: Env.webClientId,
);
}

