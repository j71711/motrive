import 'package:flutter/material.dart';

class CustomToggle extends StatelessWidget {
  final bool value;

  final Function(bool) onChanged;

  final IconData activeIcon;
  final IconData inactiveIcon;

  const CustomToggle({
    super.key,
    required this.value,
    required this.onChanged,
    required this.activeIcon,
    required this.inactiveIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        height: 42,
        width: 78,

        padding: const EdgeInsets.all(4),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),

          color: value
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context)
                  .colorScheme
                  .surfaceContainerHighest,

          border: Border.all(
            color: Theme.of(context)
                .colorScheme
                .outline
                .withValues(alpha: .15),
          ),
        ),

        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),

          alignment:
              value
                  ? Alignment.centerRight
                  : Alignment.centerLeft,

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
              value
                  ? activeIcon
                  : inactiveIcon,

              size: 18,

              color: value
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}