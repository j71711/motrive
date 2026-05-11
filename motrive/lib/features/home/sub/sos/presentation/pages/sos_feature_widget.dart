import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:motrive/features/home/sub/sos/presentation/cubit/sos_cubit.dart';
import 'package:motrive/features/home/sub/sos/presentation/cubit/sos_state.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_cubit.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_state.dart';

class SosFeatureWidget extends StatelessWidget {
  const SosFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SosCubit(GetIt.I.get()),
        ),
        BlocProvider(
          create: (_) => EmergencyContactCubit(GetIt.I.get())
            ..getEmergencyContactMethod(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final sosCubit = context.read<SosCubit>();

          return BlocListener<SosCubit, SosState>(
            listener: (context, state) {
              if (state is SosSendEmailSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('SOS email sent successfully')),
                );
              }

              if (state is SosErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            child: SizedBox(
              height: 58,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  _showSosOptions(context, sosCubit);
                },
                icon: const Icon(Icons.sos_rounded),
                label: const Text('SOS'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSosOptions(BuildContext context, SosCubit sosCubit) {
    final emergencyContactCubit = context.read<EmergencyContactCubit>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return BlocProvider.value(
          value: emergencyContactCubit,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(36),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 18,
                sigmaY: 18,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surface
                      .withValues(alpha: .82),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(36),
                  ),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: .18),
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: BlocBuilder<EmergencyContactCubit,
                        EmergencyContactState>(
                      builder: (context, state) {
                        final contacts =
                            state is EmergencyContactSuccessState
                                ? state.contacts
                                : [];

                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 45,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withValues(alpha: .25),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),

                              const SizedBox(height: 18),

                              Text(
                                'Emergency Help',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),

                              const SizedBox(height: 18),

                              _sosTile(
                                context,
                                Icons.local_police_rounded,
                                'Police',
                                'Call 999',
                                () {
                                  Navigator.pop(context);
                                  sosCubit.callPoliceMethod();
                                },
                              ),

                              _sosTile(
                                context,
                                Icons.medical_services_rounded,
                                'Ambulance',
                                'Call 997',
                                () {
                                  Navigator.pop(context);
                                  sosCubit.callAmbulanceMethod();
                                },
                              ),

                              const SizedBox(height: 10),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Emergency Contacts',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),

                              const SizedBox(height: 10),

                              if (contacts.isEmpty)
                                Text(
                                  'No emergency contacts found',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium,
                                ),

                              ...contacts.map(
                                (contact) => _sosTile(
                                  context,
                                  Icons.email_rounded,
                                  contact.name,
                                  contact.email,
                                  () {
                                    Navigator.pop(context);
                                    sosCubit.sendSosEmailMethod();
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

Widget _sosTile(
  BuildContext context,
  IconData icon,
  String title,
  String subtitle,
  VoidCallback onSwipe,
) {
  final scheme = Theme.of(context).colorScheme;

  return Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Dismissible(
        key: ValueKey('$title-$subtitle'),
        direction: DismissDirection.startToEnd,
        confirmDismiss: (_) async {
          onSwipe();
          return false;
        },

        background: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 24),
          decoration: BoxDecoration(
            color: scheme.error,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            color: scheme.onError,
            size: 24,
          ),
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 12,
              sigmaY: 12,
            ),
            child: Container(
              height: 76,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: scheme.surface.withValues(alpha: .35),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.white.withValues(alpha: .18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .08),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: scheme.error,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: scheme.onError,
                      size: 24,
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),

                        const SizedBox(height: 3),

                        Text(
                          subtitle,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: scheme.surface
                          .withValues(alpha: .55),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: scheme.onSurface
                          .withValues(alpha: .55),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
}