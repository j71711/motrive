import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:motrive/core/widgets/loading_widget.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_cubit.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/cubit/emergency_contact_state.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/pages/show_contact_dialog.dart';
import 'package:motrive/features/profile/sub/emergency_contact/presentation/pages/show_delete_dialog.dart';

class EmergencyContactFeatureWidget extends StatelessWidget {
  const EmergencyContactFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    String relation = '';
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
          relation = '';
        }
      },
      builder: (context, state) {
        if (state is EmergencyContactLoadingState) {
          return const LoadingWidget();
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
                          "emergency_contacts".tr(),
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),

                      const Gap(14),

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
                                '${contact.name} - ${contact.relation.toLowerCase().tr()}',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),

                              const Gap(5),

                              Text(
                                contact.email,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: Colors.grey.shade600),
                              ),

                              const Gap(10),

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

                                          relation = contact.relation;

                                          showContactDialog(
                                            context: context,
                                            title: 'edit_contact'.tr(),
                                            buttonText: "update".tr(),
                                            nameController: nameController,
                                            emailController: emailController,
                                            relation: relation,
                                            onPressed: (relation) {
                                              cubit
                                                  .updateEmergencyContactMethod(
                                                    id: contact.id,
                                                    name: nameController.text,
                                                    email: emailController.text,
                                                    relation: relation,
                                                    notifyEmergency: false,
                                                  );
                                            },
                                          );
                                        },
                                        child: Text('edit'.tr()),
                                      ),
                                    ),
                                  ),

                                  const Gap(10),

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
                                          showDeleteConfirmDialog(
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
                                        child: Text('delete'.tr()),
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
                            relation = '';

                            showContactDialog(
                              context: context,
                              title: 'add_contact'.tr(),
                              buttonText: 'add'.tr(),
                              nameController: nameController,
                              emailController: emailController,
                              relation: relation,
                              onPressed: (relation) {
                                cubit.addEmergencyContactMethod(
                                  name: nameController.text,
                                  email: emailController.text,
                                  relation: relation,
                                  notifyEmergency: false,
                                );
                              },
                            );
                          },

                          child: Text(
                            '+ ${'add_contact'.tr()}',
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
}
