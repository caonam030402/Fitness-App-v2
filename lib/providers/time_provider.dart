import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeReadyToGoProvider extends ChangeNotifier {
  bool _timeup = false;
  bool get isTimeUp => _timeup;

  late SharedPreferences storage;

  update() {
    _timeup = !_timeup;
    print(_timeup);
    notifyListeners();
  }
}
