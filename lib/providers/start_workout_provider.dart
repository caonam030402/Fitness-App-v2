import 'package:flutter/material.dart';

class StartWorkoutProvider extends ChangeNotifier {
  bool _timeUpReadyTogo = false;
  int _currenIndexPage = 0;
  bool isOpenModalPause = false;
  int _currenTime = 0;

  bool get isTimeUpReadyTogo => _timeUpReadyTogo;
  int get currenIndexPage => _currenIndexPage;
  bool get isOpenModalPauseState => isOpenModalPause;
  int get currenTime => _currenTime;

  update() {
    _timeUpReadyTogo = !_timeUpReadyTogo;
    notifyListeners();
  }

  openModalPause() {
    isOpenModalPause = !isOpenModalPause;
    notifyListeners();
  }

  updateTime(int time) {
    _currenTime = time;
    notifyListeners();
  }

  nextPage() {
    _currenTime = 0;
    _currenIndexPage = _currenIndexPage + 1;
    notifyListeners();
  }

  prevPage() {
    _currenTime = 0;
    _currenIndexPage = _currenIndexPage - 1;
    notifyListeners();
  }
}
