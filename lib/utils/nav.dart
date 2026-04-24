import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract final class Nav {
  static late final GoRouter router;
  static final navigatorKey = GlobalKey<NavigatorState>();

  static dynamic _currentExtra;
  static Map<String, String> _currentParams = {};
  static String _previousRoute = '';

  static dynamic get arguments => _currentExtra;
  static Map<String, String> get parameters => _currentParams;
  static String get currentRoute =>
      router.routeInformationProvider.value.uri.path;
  static String get previousRoute => _previousRoute;

  static void init(GoRouter goRouter) {
    router = goRouter;
  }

  static Future<T?> push<T extends Object?>(
    String path, {
    dynamic extra,
    Map<String, String>? parameters,
  }) {
    _previousRoute = currentRoute;
    _currentExtra = extra;
    _currentParams = parameters ?? {};
    final uri = parameters != null && parameters.isNotEmpty
        ? Uri(path: path, queryParameters: parameters).toString()
        : path;
    return router.push<T>(uri, extra: extra);
  }

  static void pushReplacement(
    String path, {
    dynamic extra,
    Map<String, String>? parameters,
  }) {
    _previousRoute = currentRoute;
    _currentExtra = extra;
    _currentParams = parameters ?? {};
    final uri = parameters != null && parameters.isNotEmpty
        ? Uri(path: path, queryParameters: parameters).toString()
        : path;
    router.pushReplacement(uri, extra: extra);
  }

  static void back<T extends Object?>([T? result]) {
    final state = navigatorKey.currentState;
    if (state != null && state.canPop()) {
      state.pop(result);
    }
  }

  static bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }

  static void popUntil(bool Function(Route<dynamic>) predicate) {
    navigatorKey.currentState?.popUntil(predicate);
  }

  static Future<T?> pushRoute<T>(Route<T> route) {
    return navigatorKey.currentState!.push<T>(route);
  }
}
