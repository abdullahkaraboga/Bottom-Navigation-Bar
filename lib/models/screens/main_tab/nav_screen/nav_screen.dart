import 'package:bottom_navigation_bar_with_provider/models/screens/inner_screens/inner_screens.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  static const route = '/nav';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nav Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton.icon(
                icon: Icon(Icons.arrow_forward),
                label: Text("With Bottom Navigation Bar"),
                onPressed: () {
                  Navigator.of(
                    context,
                    rootNavigator: false,
                  ).pushNamed(InnerScreen.route);
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 2.0, color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                )),
            OutlinedButton.icon(
                icon: Icon(Icons.arrow_forward),
                label: Text("Without Bottom Navigation Bar"),
                onPressed: () {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushNamed(InnerScreen.route);
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 2.0, color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
