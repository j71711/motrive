import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

Widget profileTile(
  BuildContext context, {
  required IconData icon,
  required String title,
  required String value,
}) {


  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
    child: Row(
      children: [
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primary.withValues(alpha: .1),
          ),
          child: Icon(icon, color: Theme.of(context).colorScheme.primary, size: 22),
        ),
        const Gap(14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              const Gap(4),
              Text(
                value,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
