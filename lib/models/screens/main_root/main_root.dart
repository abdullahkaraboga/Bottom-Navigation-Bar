import 'package:bottom_navigation_bar_with_provider/models/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainRoot extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, provider, child) {
        final bottomNavigationBarItems = provider.screens
            .map(
              (screen) => BottomNavigationBarItem(
                icon: Icon(screen.icon),
                label: screen.title,
              ),
            )
            .toList();
        final screens = provider.screens
            .map(
              (screen) => Navigator(
                key: screen.navigatorState,
                onGenerateRoute: screen.onGenerateRoute,
              ),
            )
            .toList();
        return WillPopScope(
          onWillPop: () async => provider.onWillPop(context),
          child: Scaffold(
            body: IndexedStack(
              children: screens,
              index: provider.currentTabIndex,
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: bottomNavigationBarItems,
              currentIndex: provider.currentTabIndex,
              onTap: provider.setTab,
            ),
          ),
        );
      },
    );
  }
}
