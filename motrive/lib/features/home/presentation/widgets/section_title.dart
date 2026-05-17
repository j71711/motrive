import 'package:flutter/material.dart';

Widget sectionTitle(
  BuildContext context,
  String title,
) {
  return Row(
    children: [
      Container(
        height: 28,
        width: 6,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(100),
        ),
      ),

      const SizedBox(width: 10),

      Text(
        title,
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          letterSpacing: -.5,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    ],
  );
}