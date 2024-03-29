import 'dart:developer';

import 'package:flutter/material.dart';

import '../../core.dart';

class RouterObserver extends NavigatorObserver {
  List<Route<dynamic>?> routeStack = List.empty(growable: true);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.add(route);
    log('didPush: ${routeStack.map((route) => route?.settings.name)}');
    getNavigateHistory;
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.removeLast();
    log('didPop: ${routeStack.map((route) => route?.settings.name)}');
    getNavigateHistory;
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.removeLast();
    log('didRemove: ${routeStack.map((route) => route?.settings.name)}');
    getNavigateHistory;
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    routeStack.removeLast();
    routeStack.add(newRoute);
    log('didReplace: ${routeStack.map((route) => route?.settings.name)}');
    getNavigateHistory;
  }

  void get getNavigateHistory {
    log(Modular.to.navigateHistory.map((e) => e.name).toString());
  }
}
