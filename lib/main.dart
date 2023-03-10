import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/providers/navigation_provider.dart';

void main() => runApp(BottomNavigationBarWithProvider());

class BottomNavigationBarWithProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            onGenerateRoute: NavigationProvider.of(context).onGenerateRoute,
          );
        },
      ),
    );
  }
}
