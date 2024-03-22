import 'package:fit_ness/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;
  factory CustomNavigationHelper() {
    return _instance;
  }
  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }

  CustomNavigationHelper._internal() {
    final routes = [
      GoRoute(
        path: "/",
        pageBuilder: (context, GoRouterState state) {
          return getPage(
            child: const HomeScreen(),
            state: state,
          );
        },
      ),
      // ... other routes
    ];
    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: "/",
      routes: routes,
    );
  }
}
