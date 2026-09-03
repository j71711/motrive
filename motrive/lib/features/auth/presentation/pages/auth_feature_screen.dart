import 'package:any_image_view/any_image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/constants/app_icons.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/core/theme/app_settings_state.dart';
import 'package:motrive/core/utils/validators.dart';
import 'package:motrive/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:motrive/features/auth/presentation/cubit/auth_state.dart';
import 'package:motrive/core/widgets/cirle_widget.dart';
import 'package:motrive/features/auth/presentation/widgets/otp_widget.dart';
import 'package:motrive/features/auth/presentation/widgets/textfileild.dart';
import 'package:motrive/features/profile/presentation/widgets/agreement_screen.dart';
import 'package:motrive/features/profile/presentation/widgets/toggle_widget.dart';

class AuthFeatureScreen extends HookWidget {
  const AuthFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    final emailController = useTextEditingController();
    final nameController = useTextEditingController();

    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthGoogleSuccessState) {
            context.go(Routes.home);
          }

          if (state is AuthErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message.tr())));
          }

          if (state is AuthEmailSuccessState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: cubit,
                  child: Scaffold(
                    body: SafeArea(
                      child: SingleChildScrollView(
                        child: OtpBottomSheetWidget(
                          sentTo: state.email,
                          onSubmit: (otp) {
                            cubit.emailVerify(email: state.email, otp: otp);
                          },
                          onResend: () {
                            cubit.emailSignIn(
                              email: state.email,
                              name: state.name,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final isLogin = state.isLogin ?? true;
          final size = MediaQuery.of(context).size;

          return Stack(
            children: [
              Container(
                height: size.height * .36,
                width: double.infinity,
                color: Theme.of(context).colorScheme.primary,
                child: Stack(
                  children: [
                    Positioned(
                      left: -85,
                      top: 38,
                      child: Circle(size: 185, opacity: .1),
                    ),
                    Positioned(
                      right: -35,
                      top: 100,
                      child: Circle(size: 110, opacity: .1),
                    ),
                    Positioned(
                      right: 100,
                      bottom: -40,
                      child: Circle(size: 125, opacity: .1),
                    ),
                    Positioned(
                      top: 55,
                      right: 24,
                      child: CustomToggle(
                        value: context.locale.languageCode == 'en',
                        activeIcon: Icons.language,
                        inactiveIcon: Icons.language,
                        onChanged: (value) async {
                          final locale = value
                              ? const Locale('en')
                              : const Locale('ar');

                          context.setLocale(locale);
                          context.read<ThemeCubit>().changeLanguage(locale);
                        },
                      ),
                    ),
                    Center(
                      child: Text(
                        isLogin ? 'welcome_back'.tr() : 'welcome'.tr(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  constraints: BoxConstraints(minHeight: size.height * .69),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(38),
                      topRight: Radius.circular(38),
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: isLogin ? 64 : 36),

                          if (!isLogin) ...[
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 6,
                                bottom: 8,
                              ),
                              child: Text(
                                'name'.tr(),
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            CustomTextField(
                              label: 'name'.tr(),
                              controller: nameController,
                              validator: Validators.validateFullName,
                            ),
                            const Gap(16),
                          ],

                          Padding(
                            padding: const EdgeInsets.only(left: 6, bottom: 8),
                            child: Text(
                              'email'.tr(),
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          CustomTextField(
                            label: 'email'.tr(),
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
                            validator: Validators.validateEmail,
                          ),

                          const Gap(16),

                          if (!isLogin)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHighest
                                      .withValues(alpha: .4),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: cubit.acceptedAgreement,
                                      onChanged: (value) {
                                        cubit.toggleAgreement(value ?? false);
                                        cubit.toggleSignIn();
                                        cubit.toggleSignIn();
                                      },
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  const AgreementScreen(),
                                            ),
                                          );
                                        },
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: '${'i_agree_to'.tr()} ',
                                                style: TextStyle(
                                                  color: Theme.of(
                                                    context,
                                                  ).colorScheme.onSurface,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'user_agreement'.tr(),
                                                style: TextStyle(
                                                  color: Theme.of(
                                                    context,
                                                  ).colorScheme.primary,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          SizedBox(
                            height: 56,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: state is AuthLoadingState
                                  ? null
                                  : () {
                                      if (formKey.currentState!.validate()) {
                                        if (!isLogin &&
                                            !cubit.acceptedAgreement) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'please_accept_user_agreement'
                                                    .tr(),
                                              ),
                                            ),
                                          );
                                          return;
                                        }

                                        cubit.emailSignIn(
                                          email: emailController.text.trim(),
                                          name: isLogin
                                              ? ''
                                              : nameController.text.trim(),
                                        );
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: state is AuthLoadingState
                                  ? CircularProgressIndicator(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    )
                                  : Text(
                                      isLogin
                                          ? 'send_otp'.tr()
                                          : 'sign_up'.tr(),
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onPrimary,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            ),
                          ),

                          const Gap(20),

                          SizedBox(
                            height: 54,
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: state is AuthLoadingState
                                  ? null
                                  : () {
                                      cubit.googleSignIn();
                                    },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 2.4,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AnyImageView(
                                    imagePath: AppIcons.google,
                                    height: 28,
                                    width: 28,
                                  ),
                                  const Gap(18),
                                  Text(
                                    'login_with_google'.tr(),
                                    style: TextStyle(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const Gap(32),

                          Center(
                            child: GestureDetector(
                              onTap: () {
                                cubit.toggleSignIn();
                              },
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: isLogin
                                          ? 'dont_have_account'.tr()
                                          : 'already_have_account'.tr(),
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withValues(alpha: .55),
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: isLogin
                                          ? ' sign_up'.tr()
                                          : ' sign_in'.tr(),
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const Gap(30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
