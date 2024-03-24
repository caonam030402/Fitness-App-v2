import 'package:fit_ness/providers/dark_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThemeProvider notifier, child) {
        return Switch(
            value: notifier.isDark,
            onChanged: (value) => notifier.changeTheme());
      },
    );
  }
}
