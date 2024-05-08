import 'package:fit_ness/DB/list_music.db.dart';
import 'package:flutter/material.dart';

class MusicProvider extends ChangeNotifier {
  bool _isPlaying = false;
  Music _currentMucic = musicList[0];

  Music get currentMusic => _currentMucic;

  void updateCurrentMusic(Music music) {
    _currentMucic = music;
  }

  void togglePlay() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  bool get isPlaying => _isPlaying;
}
