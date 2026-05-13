 import 'package:flutter/widgets.dart';
import 'package:motrive/core/extensions/context_extensions.dart';

void showDeleteConfirmDialog({
    required BuildContext context,
    required String contactName,
    required VoidCallback onDelete,
  }) async {
    final value = await context.showMyDialog(
      title: 'Delete Contact',
      content: 'Are you sure you want to delete $contactName?',
      confirmButton: 'Delete',
      cancelButton: 'Cancel',
      onConfirm: true,
    );

    if (value == true) {
      onDelete();
    }
  }