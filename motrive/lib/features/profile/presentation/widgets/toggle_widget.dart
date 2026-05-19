
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeToggle extends StatelessWidget {
  final bool isDark;
  final Function(bool) onChanged;

  const ThemeToggle({
    super.key,
    required this.isDark,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isDark),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        height: 42,
        width: 78,

        padding: const EdgeInsets.all(4),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),

          color: isDark
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surfaceContainerHighest,

          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: .15),
          ),
        ),

        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),

          alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,

          child: Container(
            height: 32,
            width: 32,

            decoration: BoxDecoration(
              shape: BoxShape.circle,

              color: Theme.of(context).colorScheme.surface,

              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  offset: const Offset(0, 2),

                  color: Colors.black.withValues(alpha: .12),
                ),
              ],
            ),

            child: Icon(
              isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,

              size: 18,

              color: isDark
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
