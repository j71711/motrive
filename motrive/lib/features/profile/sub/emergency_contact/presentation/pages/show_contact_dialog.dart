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
                decoration: const InputDecoration(
                  hintText: 'Name',
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),

              const Gap(14),

              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),

              const Gap(14),

              TextField(
                controller: relationController,
                decoration: const InputDecoration(
                  hintText: 'Relation',
                  labelText: 'Relation',
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
                      child: const Text('Cancel'),
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
