import 'package:bottom_navigation_bar_with_provider/models/screen_model.dart';
import 'package:bottom_navigation_bar_with_provider/models/screens/inner_screens/inner_screens.dart';
import 'package:bottom_navigation_bar_with_provider/models/screens/main_root/main_root.dart';
import 'package:bottom_navigation_bar_with_provider/models/screens/main_tab/dash_screen/dash_screen.dart';
import 'package:bottom_navigation_bar_with_provider/models/screens/main_tab/list_screen/list_screen.dart';
import 'package:bottom_navigation_bar_with_provider/models/screens/main_tab/nav_screen/nav_screen.dart';
import 'package:bottom_navigation_bar_with_provider/widgets/exit_dialog_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreensIndex {
  static int get firstScreenIndex => 0;

  static int get secondScreenIndex => 1;

  static int get thirdScreenIndex => 2;
}

class NavigationProvider extends ChangeNotifier {
  static NavigationProvider of(BuildContext context) =>
      Provider.of<NavigationProvider>(context, listen: false);
  int _currentScreenIndex = ScreensIndex.firstScreenIndex;

  int get currentTabIndex => _currentScreenIndex;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case InnerScreen.route:
        return CupertinoPageRoute(builder: (_) => InnerScreen());
      default:
        return CupertinoPageRoute(builder: (_) => MainRoot());
    }
  }

  final Map<int, ScreenModel> _screens = {
    ScreensIndex.firstScreenIndex: ScreenModel(
      title: 'Nav',
      icon: Icons.directions,
      child: NavScreen(),
      initialRoute: NavScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case InnerScreen.route:
            return CupertinoPageRoute(builder: (_) => InnerScreen());
          default:
            return CupertinoPageRoute(builder: (_) => NavScreen());
        }
      },
      scrollController: ScrollController(),
    ),
    ScreensIndex.secondScreenIndex: ScreenModel(
      title: 'List',
      icon: Icons.list,
      child: ListScreen(),
      initialRoute: ListScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          default:
            return CupertinoPageRoute(builder: (_) => ListScreen());
        }
      },
      scrollController: ScrollController(),
    ),
    ScreensIndex.thirdScreenIndex: ScreenModel(
      title: 'Dash',
      icon: Icons.flutter_dash,
      child: DashScreen(),
      initialRoute: DashScreen.route,
      navigatorState: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          default:
            return CupertinoPageRoute(builder: (_) => DashScreen());
        }
      },
      scrollController: ScrollController(),
    ),
  };

  List<ScreenModel> get screens => _screens.values.toList();

  ScreenModel? get currentScreen => _screens[_currentScreenIndex];

  void setTab(int tab) {
    if (tab == currentTabIndex) {
      _scrollToTopOfPage();
    } else {
      _currentScreenIndex = tab;
      notifyListeners();
    }
  }

  void _scrollToTopOfPage() {
    if (currentScreen?.scrollController != null &&
        currentScreen!.scrollController.hasClients) {
      currentScreen?.scrollController.animateTo(
        0.0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<bool> onWillPop(BuildContext context) async {
    final currentNavigatorState = currentScreen?.navigatorState.currentState;

    if (currentNavigatorState!.canPop()) {
      currentNavigatorState.pop();
      return false;
    } else {
      if (currentTabIndex != ScreensIndex.firstScreenIndex) {
        setTab(ScreensIndex.firstScreenIndex);
        notifyListeners();
        return false;
      } else {
        return await showDialog(
          context: context,
          builder: (context) => const ExitAlertDialog(),
        );
      }
    }
  }
}
