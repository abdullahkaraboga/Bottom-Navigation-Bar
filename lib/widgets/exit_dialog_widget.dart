import 'package:flutter/material.dart';

class ExitAlertDialog extends StatelessWidget {
  const ExitAlertDialog({super.key});

  static const String exitText = "Exit";
  static const String exitMessage = "Are you sure you want to exit ?";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(exitText),
      content: const Text(exitMessage),
      actions: <Widget>[
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text(
            'Cancel',
            style: Theme.of(context).textTheme.button?.copyWith(
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
