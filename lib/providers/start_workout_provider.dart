import 'package:flutter/material.dart';

class StartWorkoutProvider extends ChangeNotifier {
  bool _timeUpReadyTogo = false;
  int _currenIndexPage = 0;

  bool get isTimeUpReadyTogo => _timeUpReadyTogo;
  int get currenIndexPage => _currenIndexPage;

  update() {
    _timeUpReadyTogo = !_timeUpReadyTogo;
    notifyListeners();
  }

  nextPage() {
    _currenIndexPage = _currenIndexPage + 1;
    notifyListeners();
  }

  prevPage() {
    _currenIndexPage = _currenIndexPage - 1;
    notifyListeners();
  }
}
