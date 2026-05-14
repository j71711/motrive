import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:motrive/core/extensions/context_extensions.dart';
import 'package:motrive/core/widgets/loading_widget.dart';
import 'package:motrive/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:motrive/features/auth/presentation/cubit/auth_state.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

class OtpBottomSheetWidget extends HookWidget {
  final Function(String otp)? onSubmit;
  final Function()? onResend;
  final bool? pop;
  final String sentTo;
  const OtpBottomSheetWidget({
    super.key,
    this.onSubmit,
    this.onResend,
    required this.sentTo,
    this.pop,
  });

  final resendDuration = 30;

  @override
  Widget build(BuildContext context) {
    final canResend = useState(false);
    final timerText = useState(resendDuration);
    final ValueNotifier<bool> pop = useState(this.pop ?? false);

    useEffect(() {
      Timer? resendTimer;

      if (!canResend.value) {
        resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
          if (timerText.value == 0) {
            canResend.value = true;
            timer.cancel();
          } else {
            timerText.value--;
          }
        });
      }

      return () {
        resendTimer?.cancel();
      };
    }, [timerText.value]);

    if (pop.value) {
      context.pop();
    }

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Theme.of(context).colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: .20),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).colorScheme.primary),
      borderRadius: BorderRadius.circular(20),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: .08),
      ),
    );
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        context.hideLoading();

        if (state is AuthLoadingState) {
          context.showLoading();
        }

        if (state is AuthGoogleSuccessState) {
          context.hideLoading();
          if (Navigator.of(context).canPop()) {
  Navigator.of(context).pop();
}
        }

        if (state is AuthErrorState) {
          context.hideLoading();
          context.showSnackBar(state.message, isError: true);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: .all(16),
          child: Column(
            spacing: 20,
            children: [
              Text(
                'Email Verification',
                style: TextStyle(fontSize: 20.sp, fontWeight: .bold),
              ),

              Text('Enter the pin sent to this email:'),
              Text(sentTo),

              Pinput(
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                autofocus: true,
                length: 6,
                onCompleted: (pin) {
                  if (onSubmit != null) {
                    onSubmit!(pin);
                  }
                },
              ),
              if (state is AuthErrorState &&
                  state.message.contains('over_email_send_rate_limit'))
                Text(
                  'OTP is incorrect',
                  style: TextStyle(color: Colors.redAccent),
                ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: .all(
                    canResend.value ? null : Theme.of(context).disabledColor,
                  ),
                ),
                onPressed: () async {
                  if (onResend != null) {
                    if (canResend.value) {
                      onResend!();
                      canResend.value = false;
                      timerText.value = resendDuration;
                    }
                  }
                },
                child: Text("Didn't get a code? Resend OTP"),
              ),
              if (!canResend.value)
                Text('Until next try: ${timerText.value} seconds'),
            ],
          ),
        );
      },
    );
  }
}
