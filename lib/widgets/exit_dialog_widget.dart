import 'package:flutter/material.dart';

class ExitAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Exit'),
      content: Text("Are you sure you want to exit ?"),
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
          child: Text('Yes'),
        ),
      ],
    );
  }
}
