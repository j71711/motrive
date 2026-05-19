import 'package:flutter/material.dart';
import 'package:motrive/core/constants/app_policies.dart';

class AgreementScreen extends StatelessWidget {
  const AgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Agreement'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },

            icon: Container(
              height: 42,
              width: 42,

              decoration: BoxDecoration(
                shape: BoxShape.circle,

                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),

              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: .all(16),
        child: Text(
          AppPolicies.userAgreement,
          style: TextStyle(fontWeight: .w500),
        ),
      ),
    );
  }
}
