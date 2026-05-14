import 'package:flutter/material.dart';

class ErrorButton extends StatelessWidget {
  final String message;
  final Function() refresh;
  const ErrorButton({super.key, required this.message, required this.refresh});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        mainAxisSize: .min,
        children: [
          Text(message.substring(message.indexOf(':') + 1)),
          TextButton.icon(
            style: ButtonStyle(tapTargetSize: .shrinkWrap),
            onPressed: refresh,
            label: Text('Try again'),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
