import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:glass_kit/glass_kit.dart';

Widget buildGlassCard({
  required BuildContext context,
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(26),
    child: GlassContainer.frostedGlass(
      height: 135,
      borderRadius: BorderRadius.circular(26),
      blur: 10,
      borderWidth: 1,
      borderColor: Theme.of(context).colorScheme.primary.withValues(alpha: .14),
      shadowColor: Theme.of(context).colorScheme.primary.withValues(alpha: .08),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Theme.of(context).colorScheme.surface.withValues(alpha: .85),
          Theme.of(context).colorScheme.surface.withValues(alpha: .45),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary.withValues(alpha: .12),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: 30,
            ),
          ),
          const Gap(12),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    ),
  );
}