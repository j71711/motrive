import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void showContactDialog({
  required BuildContext context,
  required String title,
  required String buttonText,
  required TextEditingController nameController,
  required TextEditingController emailController,
  required TextEditingController relationController,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        backgroundColor: Theme.of(dialogContext).colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              TextField(
                controller: nameController,
                decoration:  InputDecoration(
                  hintText: 'name'.tr(),
                  labelText: 'name'.tr(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),

              const Gap(14),

              TextField(
                controller: emailController,
                decoration:  InputDecoration(
                  hintText: 'email'.tr(),
                  labelText: 'email'.tr(),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),

              const Gap(14),

              TextField(
                controller: relationController,
                decoration:  InputDecoration(
                hintText: 'relation'.tr(),
                  labelText: 'relation'.tr(),
                  prefixIcon: Icon(Icons.family_restroom_outlined),
                ),
              ),

                   const Gap(14),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                      },
                      child:  Text('cancel'.tr()),
                    ),
                  ),

                  const Gap(12),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        onPressed();
                        Navigator.of(dialogContext).pop();
                      },
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
