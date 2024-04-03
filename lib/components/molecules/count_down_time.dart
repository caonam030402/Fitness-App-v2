import 'dart:async';

import 'package:fit_ness/themes/app_texts.dart';
import 'package:flutter/material.dart';

class CountDownTime extends StatefulWidget {
  final bool onlySeconds;
  final double sizeText;
  final int seconds;
  const CountDownTime(
      {super.key,
      this.onlySeconds = true,
      this.sizeText = 70,
      required this.seconds});

  @override
  State<CountDownTime> createState() => _CountDownTimeState();
}

class _CountDownTimeState extends State<CountDownTime> {
  late int _countdownSeconds;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _countdownSeconds = widget.seconds;
    _startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startCountdown() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_countdownSeconds > 0) {
          _countdownSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  String formatSeconds(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  build(BuildContext context) {
    final _timeCountDown = formatSeconds(_countdownSeconds);
    return Text(_timeCountDown,
        style: AppTexts.darkTextTheme.headlineSmall!
            .copyWith(fontWeight: FontWeight.w600, fontSize: widget.sizeText));
  }
}
