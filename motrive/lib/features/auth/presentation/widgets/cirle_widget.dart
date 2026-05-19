import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double size;

  const Circle({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
 

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface
            .withValues(alpha: .08),
        shape: BoxShape.circle,
      ),
    );
  }
}
