import 'dart:async';

import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/providers/start_workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeReadyToGo extends StatefulWidget {
  const TimeReadyToGo({super.key});

  @override
  State<TimeReadyToGo> createState() => _TimeReadyToGoState();
}

class _TimeReadyToGoState extends State<TimeReadyToGo> {
  late StartWorkoutProvider startWorkoutProvider;
  int _countdownSeconds = 10;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startCountdown() {
    const oneSecond = Duration(seconds: 1);
    startWorkoutProvider =
        Provider.of<StartWorkoutProvider>(context, listen: false);

    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_countdownSeconds > 0) {
          _countdownSeconds--;
        } else {
          timer.cancel();
          startWorkoutProvider.updateTimeReadyTogo();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return _countdownSeconds != 0
        ? Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black26,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const Spacer(),
                    Text(
                      "READY TO GO",
                      style: themeData.textTheme.displaySmall!
                          .copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _countdownSeconds.toString(),
                      style: themeData.textTheme.displaySmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 120),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Exercise 1/21",
                      style: themeData.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "JUM PING JACKS",
                      style: themeData.textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    Button(
                      size: SizeButton.large,
                      title: "Start!",
                      width: 200,
                      onTap: () {
                        setState(() {
                          _countdownSeconds = 0;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                  ],
                ),
              )
            ],
          )
        : Container();
  }
}
