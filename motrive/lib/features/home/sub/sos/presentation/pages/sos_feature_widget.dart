import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/features/home/sub/sos/presentation/cubit/sos_cubit.dart';
import 'package:motrive/features/home/sub/sos/presentation/cubit/sos_state.dart';
import 'package:motrive/features/home/sub/sos/presentation/pages/show_sos_options..dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_cubit.dart';

class SosFeatureWidget extends StatelessWidget {
  const SosFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SosCubit(GetIt.I.get())),
        BlocProvider(
          create: (_) =>
              EmergencyContactCubit(GetIt.I.get())..getEmergencyContactMethod(),
        ),
      ],

      child: Builder(
        builder: (context) {
          final sosCubit = context.read<SosCubit>();

          return BlocListener<SosCubit, SosState>(
            listener: (context, state) {
              if (state is SosSendEmailSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('sos_email_sent_successfully'.tr())),
                );
              }

              if (state is SosErrorState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },

            child: GestureDetector(
              onTap: () {
                showSosOptions(context, sosCubit);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 84,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Theme.of(context).colorScheme.error,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).colorScheme.error.withValues(alpha: .25),
                          blurRadius: 18,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:  Theme.of(context).colorScheme.primary,
                          ),
                          child: Icon(
                            Icons.warning_amber_rounded,
                            color: Theme.of(context).colorScheme.onError,
                            size: 30,
                          ),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'sos_emergency'.tr(),
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      color:  Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'tap_to_send_emergency_alert'.tr(),
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: Theme.of(context).colorScheme.primary
                                          .withValues(alpha: .85),
                                    ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withValues(alpha: .18),
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
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
