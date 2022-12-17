import 'package:flutter/material.dart';

class DashScreen extends StatelessWidget {
  static const route = '/das';
  static const String title = 'Dash Screen';

  const DashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),centerTitle: true,),
      body: Center(
        child: Icon(
          Icons.flutter_dash_sharp,
          size: 150,
          color: Colors.blue,
        ),
      ),
    );
  }
}
