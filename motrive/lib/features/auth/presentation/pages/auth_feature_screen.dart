import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/constants/app_icons.dart';
import 'package:motrive/core/navigation/routers.dart';
import 'package:motrive/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:motrive/features/auth/presentation/cubit/auth_state.dart';
import 'package:motrive/features/auth/presentation/widgets/cirle_widget.dart';
import 'package:motrive/features/auth/presentation/widgets/otp_widget.dart';
import 'package:motrive/features/auth/presentation/widgets/textfileild.dart';

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
            ).showSnackBar(SnackBar(content: Text(state.message)));
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
                    Positioned(left: -85, top: 38, child: Circle(size: 185)),

                    Positioned(right: -35, top: 100, child: Circle(size: 110)),

                    Positioned(
                      right: 100,
                      bottom: -40,
                      child: Circle(size: 125),
                    ),

                    Center(
                      child: Text(
                        isLogin ? 'Welcome Back' : 'Welcome',
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
                  height: size.height * .69,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 34),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(38),
                      topRight: Radius.circular(38),
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: isLogin ? 78 : 52),

                          if (!isLogin) ...[
                            Padding(
                              padding: EdgeInsets.only(left: 6, bottom: 8),
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            CustomTextField(
                              label: 'name',
                              controller: nameController,
                            ),
                          ],

                          Padding(
                            padding: EdgeInsets.only(left: 6, bottom: 8),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          CustomTextField(
                            label: 'email',
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
                          ),

                          SizedBox(
                            height: 56,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: state is AuthLoadingState
                                  ? null
                                  : () {
                                      if (formKey.currentState!.validate()) {
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
                                  : DefaultTextStyle(
                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onPrimary,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      child: Text(
                                        isLogin ? 'Send OTP' : 'Sign Up',
                                      ),
                                    ),
                            ),
                          ),
                          const Gap(24),

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

                                  const Gap(24),

                                  Text(
                                    'Login With Google',
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

                          Gap(size.height * .14),

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
                                          ? "Don’t Have Account? "
                                          : "Already Have Account? ",
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
                                      text: isLogin ? 'Sign Up' : 'Sign In',
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
