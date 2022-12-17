import 'package:flutter/material.dart';

class InnerScreen extends StatelessWidget {
  static const route = '/nav/inner';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inner Screen')),
      body: Center(
        child: Text('Hello world!'),
      ),
    );
  }
}
