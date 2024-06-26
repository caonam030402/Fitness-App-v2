import 'package:fit_ness/components/templates_/infomation_user/synchronize_info.dart';
import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/features/bottom_navigation_page.dart';
import 'package:fit_ness/features/user/screens/choose_coach_screen.dart';
import 'package:fit_ness/features/daily/screens/daily_screen.dart';
import 'package:fit_ness/features/discover/screens/discover_screen.dart';
import 'package:fit_ness/features/home/screen/home_screen.dart';
import 'package:fit_ness/features/onboarding/screens/infomation_setting_screen.dart';
import 'package:fit_ness/features/user/screens/me_screen.dart';
import 'package:fit_ness/features/onboarding/screens/onboarding_screen.dart';
import 'package:fit_ness/features/personal/screens/personal_screen.dart';
import 'package:fit_ness/features/onboarding/screens/splash_screen.dart';
import 'package:fit_ness/features/onboarding/screens/welcom_screen.dart';
import 'package:fit_ness/features/user/screens/workout_setting_screen.dart';
import 'package:fit_ness/features/workout/screens/workout_completed.dart';
import 'package:fit_ness/features/workout/screens/workout_detail_screen.dart';
import 'package:fit_ness/features/workout/screens/workout_start_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;

  factory CustomNavigationHelper() {
    return _instance;
  }

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> dailyTabNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> discoverTabNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> personalTabNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> meTabNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> workoutDetailKey =
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
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: homeTabNavigatorKey,
            routes: [
              GoRoute(
                path: PathRoute.home_screen,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const HomeScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: discoverTabNavigatorKey,
            routes: [
              GoRoute(
                path: PathRoute.discover_screen,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const DiscoverScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: personalTabNavigatorKey,
            routes: [
              GoRoute(
                path: PathRoute.personal_screen,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const PersonalScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: dailyTabNavigatorKey,
            routes: [
              GoRoute(
                path: PathRoute.daily_screen,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const DailyScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: meTabNavigatorKey,
            routes: [
              GoRoute(
                path: PathRoute.me_screen,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const MeScreen(),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: BottomNavigationPage(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),
      GoRoute(
        path: PathRoute.workout_detail,
        builder: (context, state) => const WorkoutDetailScreen(),
      ),
      GoRoute(
        path: PathRoute.start_workout,
        builder: (context, state) => const StartWorkoutScreen(),
      ),
      GoRoute(
        path: PathRoute.workout_completed,
        builder: (context, state) => const WorkoutCompleted(),
      ),
      GoRoute(
          path: PathRoute.workout_setting,
          builder: (context, state) => const WorkoutSettingScreen(),
          routes: [
            GoRoute(
              path: PathRoute.choose_coach,
              builder: (context, state) => const ChooseCoachScreen(),
            ),
          ]),
      GoRoute(
        path: PathRoute.infomation_setting,
        builder: (context, state) => const InfomationSetting(),
      ),
      GoRoute(
        path: PathRoute.splash,
        builder: (context, state) => const Splash(),
      ),
      GoRoute(
        path: PathRoute.onboarding,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: PathRoute.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: PathRoute.synchronize_info,
        builder: (context, state) => const SynchronizeInfo(),
      ),
    ];
    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: PathRoute.home_screen,
      routes: routes,
    );
  }

  static late final GoRouter router;

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;
}
