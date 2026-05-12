import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_cubit.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_state.dart';

class EmergencyContactFeatureWidget extends StatelessWidget {
  EmergencyContactFeatureWidget({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final relationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EmergencyContactCubit>();

    return BlocConsumer<EmergencyContactCubit, EmergencyContactState>(
      listener: (context, state) {
        if (state is EmergencyContactErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }

        if (state is EmergencyContactActionSuccessState) {
          nameController.clear();
          emailController.clear();
          relationController.clear();
        }
      },
      builder: (context, state) {
        if (state is EmergencyContactLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is EmergencyContactSuccessState) {
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.all(12),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    border: Border.all(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: .25),
                    ),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Emergency Contacts',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      ...state.contacts.map(
                        (contact) => Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: .06),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${contact.name} - ${contact.relation}',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),

                              const SizedBox(height: 5),

                              Text(
                                contact.email,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: Colors.grey.shade600),
                              ),

                              const SizedBox(height: 10),

                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 38,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          nameController.text = contact.name;

                                          emailController.text = contact.email;

                                          relationController.text =
                                              contact.relation;

                                          _showContactDialog(
                                            context: context,
                                            title: 'Edit Contact',
                                            buttonText: 'Update',
                                            onPressed: () {
                                              cubit
                                                  .updateEmergencyContactMethod(
                                                    id: contact.id,
                                                    name: nameController.text,
                                                    email: emailController.text,
                                                    relation:
                                                        relationController.text,
                                                    notifyEmergency: false,
                                                  );

                                              Navigator.pop(context);
                                            },
                                          );
                                        },
                                        child: const Text('Edit'),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  Expanded(
                                    child: SizedBox(
                                      height: 38,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Theme.of(
                                            context,
                                          ).colorScheme.error,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          _showDeleteConfirmDialog(
                                            context: context,
                                            contactName: contact.name,
                                            onDelete: () {
                                              cubit
                                                  .deleteEmergencyContactMethod(
                                                    id: contact.id,
                                                  );
                                            },
                                          );
                                        },
                                        child: const Text('Delete'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withValues(alpha: .25),
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: () {
                            nameController.clear();
                            emailController.clear();
                            relationController.clear();

                            _showContactDialog(
                              context: context,
                              title: 'Add Contact',
                              buttonText: 'Add',
                              onPressed: () {
                                cubit.addEmergencyContactMethod(
                                  name: nameController.text,
                                  email: emailController.text,
                                  relation: relationController.text,
                                  notifyEmergency: false,
                                );

                                Navigator.pop(context);
                              },
                            );
                          },
                          child: Text(
                            '+ Add Contact',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  void _showContactDialog({
    required BuildContext context,
    required String title,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: .12),
                      child: Icon(
                        Icons.contact_emergency_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),

                const SizedBox(height: 14),

                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),

                const SizedBox(height: 14),

                TextField(
                  controller: relationController,
                  decoration: const InputDecoration(
                    hintText: 'Relation',
                    prefixIcon: Icon(Icons.family_restroom_outlined),
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onPressed,
                        child: Text(buttonText),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

void _showDeleteConfirmDialog({
  required BuildContext context,
  required String contactName,
  required VoidCallback onDelete,
}) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: const Text('Delete Contact'),
        content: Text('Are you sure you want to delete $contactName?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: () {
              Navigator.pop(context);
              onDelete();
            },
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
}
