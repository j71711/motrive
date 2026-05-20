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
                borderRadius: BorderRadius.circular(34),

                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),

                  child: Container(
                    height: 88,
                    width: double.infinity,

                    padding: const EdgeInsets.symmetric(horizontal: 20),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(34),

                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,

                        colors: [
                          Theme.of(
                            context,
                          ).colorScheme.error.withValues(alpha: .95),

                          Theme.of(
                            context,
                          ).colorScheme.errorContainer.withValues(alpha: .85),
                        ],
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).colorScheme.error.withValues(alpha: .35),

                          blurRadius: 24,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),

                    child: Row(
                      children: [
                        Container(
                          height: 58,
                          width: 58,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            color: Colors.white.withValues(alpha: .18),
                          ),

                          child: const Icon(
                            Icons.warning_rounded,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),

                        const SizedBox(width: 18),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                'sos_emergency'.tr(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 4),

                              Text(
                                'tap_to_send_emergency_alert'.tr(),

                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
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
