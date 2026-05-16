import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:motrive/core/widgets/loading_widget.dart';

extension ContextExtensions on BuildContext {
  // Snackbar
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  void showLoading() {
    LoadingWidgetOverlay().show(this);
  }

  void hideLoading() {
    LoadingWidgetOverlay().hide();
  }

  void showBottomSheet({required Widget widget, double? height, Color? color}) {
    showModalBottomSheet(
      context: this,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      clipBehavior: .hardEdge,
      builder: (context) => Container(
        padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 16),
        height: height ?? 75.h,
        width: 100.w,
        color: color,
        child: widget,
      ),
    );
  }
<<<<<<< HEAD
}
=======
  Future<T?> showMyDialog<T>({
  required String title,
  String? content,
  String? confirmButton,
  String? cancelButton,
  T? onConfirm,
  T? onCancel,
}) {
  return showDialog<T>(
    context: this,
    builder: (dialogContext) => AlertDialog(
      title: Text(title),
      content: content != null ? Text(content) : null,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(onCancel),
          child: Text(cancelButton ?? 'Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(dialogContext).pop(onConfirm),
          child: Text(confirmButton ?? 'Confirm'),
        ),
      ],
    ),
  );
}}
>>>>>>> main
