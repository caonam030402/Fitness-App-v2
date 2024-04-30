import 'dart:convert';

import 'package:fit_ness/constants/configs.dart';
import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  Future<void> authenticateWithGoogle({required BuildContext context}) async {
    try {
      await AuthService.signInWithGoogle();

      final user = AuthService.user;

      try {
        final res = await post(
          Uri.parse('${config.baseUrl}auth/signin/oauth2'),
          body: jsonEncode({
            'email': user!.email,
            '_id': user.uid,
            'name': user.displayName
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );
        print(res);
      } catch (e) {
        print(e);
      }
      context.go(PathRoute.home_screen);
    } on NoGoogleAccountChosenException {
      return;
    } catch (e) {
      if (!context.mounted) return;
      print(e);
    }
  }
}

class NoGoogleAccountChosenException implements Exception {
  const NoGoogleAccountChosenException();
}
