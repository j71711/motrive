import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/features/profile/sub/sign_out/presentation/cubit/sign_out_cubit.dart';
import 'package:motrive/features/profile/sub/sign_out/presentation/cubit/sign_out_state.dart';

class SignOutFeatureWidget extends StatelessWidget {
  const SignOutFeatureWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<SignOutCubit>();
          return BlocListener<SignOutCubit, SignOutState>(
            listener: (context, state) {
              context.hideLoading();
              if (state is SignOutSuccessState) {
                context.go(Routes.loading);
              }
              if (state is SignOutErrorState) {
                context.showSnackBar(state.message, isError: true);
              }
              if (state is SignOutLoadingState) {
                context.showLoading();
              }
            },
            child: IconButton(
              color: Colors.redAccent,
              onPressed: () async {
                await context
                    .showMyDialog(
                      title: 'Sign Out',
                      content:
                          "You're about to sign out if your account\n Are you sure ?",
                      onConfirm: true,
                      confirmButton: 'Sign Out',
                    )
                    .then((value) {
                      if (value == true) {
                        cubit.getSignOutMethod();
                      }
                    });
              },
              icon: Icon(Icons.logout),
            ),
          );
        },
      ),
    );
  }
}
