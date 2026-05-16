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
          height: 76,
          borderRadius: 30,
          elevation: 0,
          innerColor: Theme.of(context).colorScheme.error,
          outerColor: Theme.of(context).colorScheme.surface.withValues(alpha: .35),
          sliderButtonIcon: Icon(
            icon,
            color: Theme.of(context).colorScheme.onError,
            size: 24,
          ),
          text: '$title . $subtitle ',
          textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
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