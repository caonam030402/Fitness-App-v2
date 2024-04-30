import 'dart:convert';

import 'package:fit_ness/constants/configs.dart';
import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';

class AuthProvider extends ChangeNotifier {
  authenticateWithGoogle({required BuildContext context}) async {
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
        final jsonResponse = jsonDecode(res.body);
        return jsonResponse['data']['new'];
      } catch (e) {
        print(e);
      }
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
