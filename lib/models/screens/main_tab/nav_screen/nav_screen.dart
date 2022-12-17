import 'package:bottom_navigation_bar_with_provider/models/screens/inner_screens/inner_screens.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatelessWidget {
  static const route = '/nav';
  static const String title = 'Nav Screen';

  const NavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton.icon(
                icon: const Icon(Icons.arrow_forward),
                label: const Text("With Bottom Navigation Bar"),
                onPressed: () {
                  Navigator.of(
                    context,
                    rootNavigator: false,
                  ).pushNamed(InnerScreen.route);
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 2.0, color: Colors.blue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                )),
            OutlinedButton.icon(
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Without Bottom Navigation Bar"),
                onPressed: () {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).pushNamed(InnerScreen.route);
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 2.0, color: Colors.blue),
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
