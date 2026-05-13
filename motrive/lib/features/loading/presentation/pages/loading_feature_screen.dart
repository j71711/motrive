import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/core/widgets/loading_widget.dart';
import 'package:motrive/features/loading/presentation/cubit/loading_cubit.dart';
import 'package:motrive/features/loading/presentation/cubit/loading_state.dart';
import 'package:sizer/sizer.dart';
class LoadingFeatureScreen extends StatelessWidget {
  const LoadingFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<LoadingCubit>();

    return Scaffold(
      body: BlocListener<LoadingCubit, LoadingState>(
        listener: (context, state) {
          switch (state) {
            case LoadingSuccessState _:
              if (state.isLogin) {
                context.go(Routes.home);
                return;
              }
              context.go(Routes.auth);
              break;
            case LoadingErrorState _:
              context.showSnackBar(state.message);
              break;
            default:
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'motorive',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 25.sp,
                      fontWeight: .bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(child: LoadingWidget()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
