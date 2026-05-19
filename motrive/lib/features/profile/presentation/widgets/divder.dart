
   import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

Widget divider(BuildContext context) {
    return Divider(
      height: 1,
      indent: 22,
      endIndent: 22,

      color: Theme.of(context).colorScheme.outline.withValues(alpha: .08),
    );
  }

   Widget settingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    bool isLogout = false,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),

          child: Row(
            children: [
              /// ICON
              Container(
                height: 52,
                width: 52,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: isLogout
                      ? Theme.of(
                          context,
                        ).colorScheme.error.withValues(alpha: .1)
                      : Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: .1),
                ),

                child: Icon(
                  icon,
                  size: 24,

                  color: isLogout
                      ? Theme.of(context).colorScheme.error
                      : Theme.of(context).colorScheme.primary,
                ),
              ),

              const Gap(16),

              /// TEXT
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      title,

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,

                        color: isLogout
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                    ),

                    const Gap(4),

                    Text(
                      subtitle,

                      style: TextStyle(
                        fontSize: 14,

                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: .55),
                      ),
                    ),
                  ],
                ),
              ),

              trailing ??
                  Icon(
                    Icons.chevron_right_rounded,

                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: .35),
                  ),
            ],
          ),
        ),
      ),
    );
  }

