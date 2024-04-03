import 'package:flutter/material.dart';

class MyNavObserver extends NavigatorObserver {
  void log(value) => debugPrint('MyNavObserver:$value');

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('didPush');
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('didPop');
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      log('didRemove');

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) =>
      log('didReplace');

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) =>
      log('didStartUserGesture: ${route.toString()}, '
          'previousRoute= ${previousRoute?.toString()}');

  @override
  void didStopUserGesture() => log('didStopUserGesture');
}
