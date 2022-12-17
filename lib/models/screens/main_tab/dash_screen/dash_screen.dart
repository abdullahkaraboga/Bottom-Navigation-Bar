import 'package:flutter/material.dart';

class DashScreen extends StatelessWidget {
  static const route = '/dash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dash Screen'),centerTitle: true,),
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
