import 'package:fit_ness/providers/auth_provider.dart';
import 'package:fit_ness/providers/dark_mode_provider.dart';
import 'package:fit_ness/providers/start_workout_provider.dart';
import 'package:fit_ness/services/router_service.dart';
import 'package:fit_ness/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CustomNavigationHelper.instance;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        ChangeNotifierProvider(
          create: (BuildContext context) => AuthProvider(),
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
