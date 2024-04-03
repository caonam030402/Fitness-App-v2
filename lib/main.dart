import 'package:fit_ness/providers/dark_mode_provider.dart';
import 'package:fit_ness/providers/start_workout_provider.dart';
import 'package:fit_ness/services/router_service.dart';
import 'package:fit_ness/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CustomNavigationHelper.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ThemeProvider()..init(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => StartWorkoutProvider(),
        ),
      ],
      child: Consumer(
        builder: (context, ThemeProvider notifier, child) {
          return MaterialApp.router(
            theme: AppThemes.lightTheme,
            themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme:
                notifier.isDark ? AppThemes.darkTheme : AppThemes.lightTheme,
            debugShowCheckedModeBanner: false,
            routerConfig: CustomNavigationHelper.router,
          );
        },
      ),
    );
  }
}
