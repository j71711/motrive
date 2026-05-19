import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:motrive/core/constants/app_hive_keys.dart';
import 'package:motrive/core/services/user_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppSettingsState {
  final ThemeMode themeMode;
  final Locale locale;

  const AppSettingsState({required this.themeMode, required this.locale});

  AppSettingsState copyWith({ThemeMode? themeMode, Locale? locale}) {
    return AppSettingsState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }
}

class ThemeCubit extends Cubit<AppSettingsState> {
  final SupabaseClient _supabase;
  final UserService _userService;
  final Box _box;

  ThemeCubit(this._supabase, this._userService, this._box)
    : super(
        AppSettingsState(
          themeMode: _loadLocalTheme(_box),
          locale: _loadLocalLocale(_box),
        ),
      );

  static ThemeMode _loadLocalTheme(Box box) {
    final value = box.get(HiveBoxes.theme);

    if (value == 'dark') {
      return ThemeMode.dark;
    }

    return ThemeMode.light;
  }

  static Locale _loadLocalLocale(Box box) {
    final value = box.get(HiveBoxes.language);

    if (value == 'ar') {
      return const Locale('ar');
    }

    return const Locale('en');
  }

  Future<void> getSettingsMethod() async {
    final user = _userService.currentUser;

    if (user == null) {
      return;
    }

    final response = await _supabase
        .from('user_settings')
        .select()
        .eq('user_id', user.id)
        .maybeSingle();

    if (response == null) {
      return;
    }

    final themeMode = response['preferred_theme'] == 'dark'
        ? ThemeMode.dark
        : ThemeMode.light;

    final locale = Locale(response['preferred_lang'] ?? 'en');

    await _box.put(
      HiveBoxes.theme,
      themeMode == ThemeMode.dark ? 'dark' : 'light',
    );

    await _box.put(HiveBoxes.language, locale.languageCode);

    emit(AppSettingsState(themeMode: themeMode, locale: locale));
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    await _box.put(
      HiveBoxes.theme,
      themeMode == ThemeMode.dark ? 'dark' : 'light',
    );

    final user = _userService.currentUser;

    if (user != null) {
      await _supabase.from('user_settings').upsert({
        'user_id': user.id,
        'preferred_theme': themeMode == ThemeMode.dark ? 'dark' : 'light',
        'preferred_lang': state.locale.languageCode,
      });
    }

    emit(state.copyWith(themeMode: themeMode));
  }

  Future<void> changeLanguage(Locale locale) async {
    await _box.put(HiveBoxes.language, locale.languageCode);

    final user = _userService.currentUser;

    if (user != null) {
      await _supabase.from('user_settings').upsert({
        'user_id': user.id,
        'preferred_theme': state.themeMode == ThemeMode.dark ? 'dark' : 'light',
        'preferred_lang': locale.languageCode,
      });
    }

    emit(state.copyWith(locale: locale));
  }
}
