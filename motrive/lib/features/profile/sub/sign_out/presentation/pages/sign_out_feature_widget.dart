import 'package:easy_localization/easy_localization.dart';
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
    final theme = Theme.of(context);

    return BlocProvider(
      create: (_) => SignOutCubit(GetIt.I.get()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<SignOutCubit>();

          return BlocListener<SignOutCubit, SignOutState>(
            listener: (context, state) {
              context.hideLoading();

              if (state is SignOutLoadingState) {
                context.showLoading();
              }

              if (state is SignOutSuccessState) {
                context.go(Routes.loading);
              }

              if (state is SignOutErrorState) {
                context.showSnackBar(state.message, isError: true);
              }
            },
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () async {
                  final value = await context.showMyDialog(
                    title: 'sign_out'.tr(),
                    content: "sign_out_message".tr(),
                    onConfirm: true,
                    confirmButton: 'sign_out'.tr(),
                    cancelButton: 'cancel'.tr(),
                  );

                  if (value == true) {
                    cubit.getSignOutMethod();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: theme.colorScheme.surface,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: theme.colorScheme.error.withValues(alpha: .12),
                        ),
                        child: Icon(
                          Icons.logout_rounded,
                          color: theme.colorScheme.error,
                          size: 26,
                        ),
                      ),

                      const SizedBox(width: 18),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'sign_out'.tr(),
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: theme.colorScheme.error,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              'logout_from_your_account'.tr(),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface.withValues(
                                  alpha: .55,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Icon(
                        Icons.chevron_right_rounded,
                        size: 28,
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: .25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
