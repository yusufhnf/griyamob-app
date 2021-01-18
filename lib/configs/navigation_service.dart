import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }

  Future<dynamic> initialNavigate(String routeName) {
    return navigatorKey.currentState
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}
