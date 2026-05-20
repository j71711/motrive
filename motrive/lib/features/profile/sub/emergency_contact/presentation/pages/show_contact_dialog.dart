import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:motrive/core/constants/app_enums.dart';
import 'package:motrive/core/utils/validators.dart';

void showContactDialog({
  required BuildContext context,
  required String title,
  required String buttonText,
  required TextEditingController nameController,
  required TextEditingController emailController,
  required String relation,
  required Function(String) onPressed,
}) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      final fromKey = GlobalKey<FormState>();
      return Dialog(
        backgroundColor: Theme.of(dialogContext).colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Form(
            key: fromKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title),
                TextFormField(
                  controller: nameController,
                  validator: Validators.validateRequired,
                  decoration: InputDecoration(
                    hintText: 'name'.tr(),
                    labelText: 'name'.tr(),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),

                const Gap(14),

                TextFormField(
                  controller: emailController,
                  validator: Validators.validateEmail,
                  decoration: InputDecoration(
                    hintText: 'email'.tr(),
                    labelText: 'email'.tr(),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),

                const Gap(14),

                DropdownButtonFormField(
                  initialValue: relation.isEmpty ? null : relation,
                  validator: Validators.validateRequired,
                  decoration: InputDecoration(
                    hintText: 'relation'.tr(),
                    labelText: 'relation'.tr(),
                    prefixIcon: Icon(Icons.family_restroom_outlined),
                  ),
                  items: Relation.values
                      .map(
                        (relation) => DropdownMenuItem(
                          value: relation.value,
                          child: Text(relation.name.tr()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    relation = value!;
                  },
                ),

                const Gap(14),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                        },
                        child: Text('cancel'.tr()),
                      ),
                    ),

                    const Gap(12),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (fromKey.currentState!.validate()) {
                            onPressed(relation);
                            Navigator.of(dialogContext).pop();
                          }
                        },
                        child: Text(buttonText),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
