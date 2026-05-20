import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:motrive/core/extensions/context_extensions.dart';

void showDeleteConfirmDialog({
  required BuildContext context,
  required String contactName,
  required VoidCallback onDelete,
}) async {
  final value = await context.showMyDialog(
    title: 'delete_contact'.tr(),
    content: '${'delete_contact_message'.tr()} $contactName?',
    confirmButton: 'delete'.tr(),
    cancelButton: 'cancel'.tr(),
    onConfirm: true,
  );

  if (value == true) {
    onDelete();
  }
}
