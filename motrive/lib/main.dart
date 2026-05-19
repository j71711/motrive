import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/core/theme/theme_cubit.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sizer/sizer.dart';

import 'core/setup.dart';
import 'core/theme/app_theme.dart';
import 'core/di/configure_dependencies.dart';
import 'core/navigation/app_router.dart';

Future<void> main() async {
  SentryWidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await setup();
  await configureDependencies();

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://0f53efbded0c05e01fdafc2574c26dfb@o4511409715740672.ingest.us.sentry.io/4511409719083008';
      options.tracesSampleRate = 1.0;
    },
    appRunner: () {
      runApp(
        SentryWidget(
          child: EasyLocalization(
            supportedLocales: const [Locale('en'), Locale('ar')],
            path: 'assets/translations',
            fallbackLocale: const Locale('en'),
            child: BlocProvider(
              create: (_) => ThemeCubit(),
              child: const MainApp(),
            ),
          ),
        ),
      );
    },
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        return Sizer(
          builder: (context, orientation, screenType) {
            return MaterialApp.router(
              themeAnimationDuration: Duration.zero,
              routerConfig: AppRouter.router,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              themeMode: state,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
