import 'package:bottom_navigation_bar_with_provider/models/providers/navigation_provider.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  static const route = '/list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Screen'),centerTitle: true,),
      body: ListView.builder(
        controller: NavigationProvider.of(context)
            .screens[ScreensIndex.firstScreenIndex]
            .scrollController,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item: $index'),
          );
        },
      ),
    );
  }
}
