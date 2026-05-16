import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:motrive/core/widgets/nav_bar.dart';
import 'package:motrive/features/maintenance/domain/entities/service_info_entity.dart';
>>>>>>> main
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/auth/presentation/pages/auth_feature_screen.dart';
import 'package:motrive/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:motrive/features/home/presentation/pages/home_feature_screen.dart';
import 'package:motrive/features/home/presentation/cubit/home_cubit.dart';
<<<<<<< HEAD
=======
import 'package:motrive/features/profile/presentation/pages/profile_feature_screen.dart';
import 'package:motrive/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:motrive/features/maintenance/presentation/pages/maintenance_feature_screen.dart';
import 'package:motrive/features/maintenance/presentation/cubit/maintenance_cubit.dart';
import 'package:motrive/features/maintenance_details/presentation/pages/maintenance_details_feature_screen.dart';
import 'package:motrive/features/maintenance_details/presentation/cubit/maintenance_details_cubit.dart';
import 'package:motrive/features/loading/presentation/pages/loading_feature_screen.dart';
import 'package:motrive/features/loading/presentation/cubit/loading_cubit.dart';
import 'package:motrive/features/expenses/presentation/pages/expenses_feature_screen.dart';
import 'package:motrive/features/expenses/presentation/cubit/expenses_cubit.dart';

>>>>>>> main

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.home,
    routes: [
<<<<<<< HEAD
=======
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            NavBar(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.home,
                builder: (context, state) => BlocProvider(
                  create: (context) => HomeCubit(GetIt.I.get()),
                  child: const HomeFeatureScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.maintenance,
                builder: (context, state) => BlocProvider(
                  create: (context) => MaintenanceCubit(GetIt.I.get()),
                  child: const MaintenanceFeatureScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profile,
                builder: (context, state) => BlocProvider(
                  create: (context) => ProfileCubit(GetIt.I.get()),
                  child: const ProfileFeatureScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
>>>>>>> main
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return Scaffold(body: Center(child: Text("splash screen")));
        }, // SplashScreen
      ),

      GoRoute(
        path: Routes.auth,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(GetIt.I.get()),
          child: const AuthFeatureScreen(),
        ),
      ),
<<<<<<< HEAD

      // GoRoute(
      //   path: Routes.loading,
      //   builder: (context, state) => BlocProvider(
      //         create: (context) => LoadingCubit(GetIt.I.get()),
      //         child: const LoadingFeatureScreen(),
      //       ),
      // ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(GetIt.I.get()),
          child: const HomeFeatureScreen(),
        ),
      ),
    ],
=======
    
  GoRoute(
    path: Routes.maintenanceDetails,
    builder: (context, state) => BlocProvider(
          create: (context) => MaintenanceDetailsCubit(GetIt.I.get()),
          child: MaintenanceDetailsFeatureScreen(serviceInfo: state.extra as ServiceInfoEntity,),
        ),
  ),

  GoRoute(
    path: Routes.loading,
    builder: (context, state) => BlocProvider(
          create: (context) => LoadingCubit(GetIt.I.get()),
          child: const LoadingFeatureScreen(),
        ),
  ),

  GoRoute(
    path: Routes.expenses,
    builder: (context, state) => BlocProvider(
          create: (context) => ExpensesCubit(GetIt.I.get()),
          child: const ExpensesFeatureScreen(),
        ),
  ),
],
>>>>>>> main

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
