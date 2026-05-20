import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SeverityWidget extends StatelessWidget {
  final String severity;
  final bool Function(String severity)? onSeverity;
  final bool widthWithText;
  final List<ColorSwatch<int>>? colors;
  const SeverityWidget({
    super.key,
    required this.severity,
    this.onSeverity,
    this.widthWithText = false, this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final colors = this.colors ?? [Colors.green, Colors.orangeAccent];
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
          ? Text(severity.tr(), style: TextStyle(color: Colors.white))
          : Center(
              child: Text(severity.tr(), style: TextStyle(color: Colors.white)),
            ),
    );
  }
}
