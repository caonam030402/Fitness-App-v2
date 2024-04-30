import 'dart:async';

import 'package:fit_ness/components/molecules/controller.dart';
import 'package:fit_ness/components/templates_/time_ready_to_go.dart';
import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/providers/start_workout_provider.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fit_ness/themes/app_texts.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StartWorkoutScreen extends StatelessWidget {
  const StartWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int listLenght = 5;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
            Consumer<StartWorkoutProvider>(builder: (context, provider, child) {
          if (listLenght < provider.currenIndexPage + 1) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.push(PathRoute.workout_completed);
            });
            return Container();
          }
          return IndexedStack(
            index: provider.currenIndexPage,
            children: List.generate(
              listLenght,
              (index) => Stack(
                children: [
                  // WorkoutPause(),
                  _body(context, UniqueKey(), provider),
                  index == 0 ? const TimeReadyToGo() : Container(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

Widget _body(BuildContext context, Key key, StartWorkoutProvider provider) {
  return Stack(
    children: [
      // SizedBox(
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   child: VideoItem(
      //     videoPlayerController:
      //         VideoPlayerController.asset('assets/videos/0410(2).mp4'),
      //     looping: true,
      //     autoplay: true,
      //   ),
      // ),
      SizedBox(
        key: key,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppStyles.paddingBothSides),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(10, (index) {
                      return Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 20,
                            height: 5,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          const SizedBox(width: 10),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.2)),
                        width: 32,
                        height: 32,
                        child: const Center(
                          child: Icon(
                            FluentIcons.dismiss_12_filled,
                            size: 13,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "SIT-UPS",
                                style: AppTexts.lightTextTheme.bodyLarge!
                                    .copyWith(fontWeight: FontWeight.w800),
                              ),
                              Text(
                                "Next",
                                style: AppTexts.lightTextTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(0.2)),
                            width: 32,
                            height: 32,
                            child: const Center(
                              child: Icon(
                                FluentIcons.settings_16_filled,
                                size: 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            provider.isTimeUpReadyTogo
                ? const ControllerExercise(seconds: 5)
                : Container()
          ],
        ),
      ),
    ],
  );
}

class ControllerExercise extends StatefulWidget {
  final int seconds;

  const ControllerExercise({super.key, required this.seconds});

  @override
  State<ControllerExercise> createState() => _ControllerExerciseState();
}

class _ControllerExerciseState extends State<ControllerExercise> {
  late int _countdownSeconds;
  late Timer _timer;
  int id = 1;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    _countdownSeconds = widget.seconds;

    _startCountdown();
  }

  void _pauseCountdown() {
    _timer.cancel();
    setState(() {
      isPaused = true;
    });
  }

  void _startCountdown() {
    const oneSecond = Duration(seconds: 1);
    if (!isPaused) {
      _timer = Timer.periodic(oneSecond, (timer) {
        setState(() {
          if (_countdownSeconds > 0) {
            _countdownSeconds--;
          } else {
            timer.cancel();
            final startWorkoutProvider =
                Provider.of<StartWorkoutProvider>(context, listen: false);
            startWorkoutProvider.nextPage();
          }
        });
      });
    }
  }

  void _resumeCountdown() {
    setState(() {
      isPaused = false;
    });
    _startCountdown();
  }

  String formatSeconds(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          )),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            "JUMPING JACKS",
            style: AppTexts.darkTextTheme.headlineSmall!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          Text(formatSeconds(_countdownSeconds),
              style: AppTexts.darkTextTheme.headlineSmall!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 70)),
          const Spacer(),
          Controller(
            pauseCountdown: _pauseCountdown,
            time: 10,
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
