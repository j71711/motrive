import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:motrive/features/home/sub/sos/presentation/cubit/sos_cubit.dart';
import 'package:motrive/features/home/sub/sos/presentation/pages/sos_tile.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_cubit.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_state.dart';

void showSosOptions(BuildContext context, SosCubit sosCubit) {
  final emergencyContactCubit = context.read<EmergencyContactCubit>();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return BlocProvider.value(
        value: emergencyContactCubit,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(36)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.surface.withValues(alpha: .82),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(36),
                ),
                border: Border.all(color: Colors.white.withValues(alpha: .18)),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child:
                      BlocBuilder<EmergencyContactCubit, EmergencyContactState>(
                        builder: (context, state) {
                          final contacts = state is EmergencyContactSuccessState
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
                                    color: Theme.of(context).colorScheme.primary
                                        .withValues(alpha: .25),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),

                                const Gap(18),

                                Text(
                                  'emergency_help'.tr(),
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),

                                const Gap(18),

                                sosTile(
                                  context,
                                  Icons.local_police_rounded,
                                 'police'.tr(),
                                 'call_999'.tr(),
                                  () {
                                    Navigator.pop(context);
                                    sosCubit.callPoliceMethod();
                                  },
                                ),

                                sosTile(
                                  context,
                                  Icons.medical_services_rounded,
                                 'ambulance'.tr(),
                                  'call_997'.tr(),
                                  () {
                                    Navigator.pop(context);
                                    sosCubit.callAmbulanceMethod();
                                  },
                                ),

                                const Gap(10),

                                Text(
                                  textAlign: .start,
                               'emergency_contact'.tr(),
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const Gap(10),

                                sosTile(
                                  context,
                                  Icons.email_rounded,
                                'contact'.tr(),
                                  contacts.isEmpty
                                      ?'no_contacts'.tr()
                                      : contacts
                                            .map((contact) => contact.name)
                                            .join(', '),
                                  () {
                                    Navigator.pop(context);
                                    sosCubit.sendSosEmailMethod();
                                  },
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
