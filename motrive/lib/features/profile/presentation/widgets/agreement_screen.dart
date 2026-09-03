import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:motrive/core/constants/app_policies.dart';

class AgreementScreen extends StatelessWidget {
  const AgreementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = context.locale.languageCode;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'user_agreement'.tr(),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,
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
        padding: const EdgeInsets.all(16),
        child: SelectableText(
          languageCode == 'ar'
              ? AppPolicies.userAgreementAr
              : AppPolicies.userAgreementEr,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}