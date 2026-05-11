import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/core/services/emergency_service.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_cubit.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_state.dart';

class SosFeatureWidget extends StatelessWidget {
  SosFeatureWidget({super.key});

  final EmergencyService emergencyService = EmergencyService();

  void _showSosOptions(BuildContext context) {
    final cubit = context.read<EmergencyContactCubit>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return BlocProvider.value(
          value: cubit,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: BlocBuilder<EmergencyContactCubit, EmergencyContactState>(
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
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: .25),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Emergency Help',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
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
                            emergencyService.callPolice();
                          },
                        ),
                        _sosTile(
                          context,
                          Icons.medical_services_rounded,
                          'Ambulance',
                          'Call 997',
                          () {
                            Navigator.pop(context);
                            emergencyService.callAmbulance();
                          },
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Emergency Contacts',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...contacts.map(
                          (contact) => _sosTile(
                            context,
                            Icons.email_rounded,
                            contact.name,
                            contact.email,
                            () {
                              Navigator.pop(context);

                              emergencyService.sendSosEmailFromSupabase(
                                email: contact.email,
                              );
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
        );
      },
    );
  }

  Widget _sosTile(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    final color = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: color.withValues(alpha: .06),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color.withValues(alpha: .12)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withValues(alpha: .12),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleMedium),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded, size: 16, color: color),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          _showSosOptions(context);
        },
        icon: const Icon(Icons.sos_rounded),
        label: const Text('SOS'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}
