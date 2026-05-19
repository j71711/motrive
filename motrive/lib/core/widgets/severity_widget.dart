import 'package:flutter/material.dart';
import 'package:motrive/core/extensions/string_extensions.dart';
import 'package:sizer/sizer.dart';

class SeverityWidget extends StatelessWidget {
  final String severity;
  final bool Function(String severity)? onSeverity;
  final bool widthWithText;
  const SeverityWidget({
    super.key,
    required this.severity,
    this.onSeverity,
    this.widthWithText = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = [Colors.green, Colors.orangeAccent];
    return Container(
      margin: .symmetric(horizontal: 4),
      padding: .symmetric(horizontal: 8, vertical: 3),
      height: 6.w,
      decoration: BoxDecoration(
        borderRadius: .circular(16),
        color: (onSeverity == null ? true : onSeverity!(severity))
            ? colors[0]
            : colors[1],
      ),
      child: widthWithText
          ? Text(
              severity.capitalizeWords,
              style: TextStyle(color: Colors.white),
            )
          : Center(
              child: Text(
                severity.capitalizeWords,
                style: TextStyle(color: Colors.white),
              ),
            ),
    );
  }
}
