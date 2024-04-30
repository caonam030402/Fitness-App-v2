import 'package:fit_ness/models/user.model.dart';
import 'package:fit_ness/services/auth_service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _userInfoUpdate = User(
    age: 1992,
    gender: "Male",
    height: 120,
    weight: 60,
    // avatar: "https://i.pravatar.cc/300",
    // name: AuthService.user?.displayName,
    // email: AuthService.user?.email,
    // id: AuthService.user?.uid
  );

  User get userInfoUpdate => _userInfoUpdate;

  void updateUser({double? height, double? weight, int? age, String? gender}) {
    _userInfoUpdate = User(
      height: height ?? _userInfoUpdate.height,
      weight: weight ?? _userInfoUpdate.weight,
      age: age ?? _userInfoUpdate.age,
      gender: gender ?? _userInfoUpdate.gender,
    );
    notifyListeners();
  }
}
