import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

Widget sosTile(
  BuildContext context,
  IconData icon,
  String title,
  String subtitle,
  VoidCallback onSwipe,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: SlideAction(
          height: 72,
          borderRadius: 28,
          elevation: 0,
          innerColor: Theme.of(context).colorScheme.error,
          outerColor: Theme.of(
            context,
          ).colorScheme.error.withValues(alpha: .18),

          sliderButtonIcon: Icon(
            Icons.keyboard_double_arrow_right_rounded,
            color: Theme.of(context).colorScheme.onError,
            size: 28,
          ),

          text: 'Swipe to call $title',
          textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.onSurface,
          ),

          submittedIcon: Icon(
            Icons.check_rounded,
            color: Theme.of(context).colorScheme.onError,
          ),

          onSubmit: () {
            onSwipe();
            return null;
          },
        ),
      ),
    ),
  );
}
