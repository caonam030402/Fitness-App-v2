import 'dart:async';

import 'package:fit_ness/components/molecules/controller.dart';
import 'package:fit_ness/features/workout/screens/time_ready_to_go.dart';
import 'package:fit_ness/features/workout/screens/workout_intro_next.dart';
import 'package:fit_ness/features/workout/screens/workout_pause.dart';
import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/models/workout.model.dart';
import 'package:fit_ness/providers/music_provider.dart';
import 'package:fit_ness/providers/start_workout_provider.dart';
import 'package:fit_ness/features/workout/screens/workout_completed.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fit_ness/themes/app_texts.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';

class StartWorkoutScreen extends StatefulWidget {
  const StartWorkoutScreen({super.key});

  @override
  State<StartWorkoutScreen> createState() => _StartWorkoutScreenState();
}

class _StartWorkoutScreenState extends State<StartWorkoutScreen> {
  late AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    final MusicProvider provider =
        Provider.of<MusicProvider>(context, listen: false);
    super.initState();

    player = AudioPlayer();

    player.setReleaseMode(ReleaseMode.stop);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player.setSource(AssetSource(provider.currentMusic.musicUrl));
      await player.resume();
    });
  }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exercises = GoRouterState.of(context).extra! as List<Exercise>;
    int listLenght = exercises.length;

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
            Consumer<StartWorkoutProvider>(builder: (context, provider, child) {
          if (listLenght < provider.currenIndexPage + 1) {
            return const WorkoutCompleted();
          }

          return IndexedStack(
            index: provider.currenIndexPage,
            children: List.generate(listLenght, (index) {
              final exercise = exercises[index];
              if (provider.intro) {
                return WorkoutIntroNext(
                  exercise: exercise,
                  index: index,
                  listLenght: listLenght,
                );
              }
              return Stack(
                children: [
                  _body(
                    index,
                    context,
                    UniqueKey(),
                    provider,
                    exercises,
                  ),
                  index == 0 ? const TimeReadyToGo() : Container(),
                ],
              );
            }),
          );
        }),
      ),
    );
  }
}

Widget _body(
  int index,
  BuildContext context,
  Key key,
  StartWorkoutProvider provider,
  List<Exercise> exercises,
) {
  final startWorkoutProvider =
      Provider.of<StartWorkoutProvider>(context, listen: false);

  final exercise = exercises[index];
  final nextExercise =
      index >= 0 && index < exercises.length - 1 ? exercises[index + 1] : null;

  // print(nextExercise != null ? nextExercise.title : 'null');
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
                    children: List.generate(exercises.length, (index) {
                      final isActive = index == provider.currenIndexPage;

                      return Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 20,
                            height: 5,
                            decoration: BoxDecoration(
                                color: isActive
                                    ? AppColors.primaryColor
                                    : Colors.black26,
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
                                exercise.title.toUpperCase(),
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
                          GestureDetector(
                            onTap: () {
                              context.push(PathRoute.workout_setting);
                            },
                            child: Container(
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            !startWorkoutProvider.isOpenModalPauseState &&
                    provider.isTimeUpReadyTogo
                ? ControllerExercise(
                    exercise: exercise,
                    seconds: provider.currenTime == 0
                        ? exercise.fitTime
                        : provider.currenTime)
                : Container()
          ],
        ),
      ),
      startWorkoutProvider.isOpenModalPauseState
          ? const WorkoutPause()
          : Container(),
    ],
  );
}

class ControllerExercise extends StatefulWidget {
  final int seconds;
  final Exercise exercise;

  const ControllerExercise({
    super.key,
    required this.seconds,
    required this.exercise,
  });

  @override
  State<ControllerExercise> createState() => _ControllerExerciseState();
}

class _ControllerExerciseState extends State<ControllerExercise> {
  late Timer _timer;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), _updateCountdown);
  }

  void _updateCountdown(Timer timer) {
    final startWorkoutProvider =
        Provider.of<StartWorkoutProvider>(context, listen: false);
    startWorkoutProvider.updateTime(widget.seconds);
    setState(() {
      if (startWorkoutProvider.currenTime > 1) {
        startWorkoutProvider.updateTime(startWorkoutProvider.currenTime - 1);
      } else {
        startWorkoutProvider.updateIntro();
        startWorkoutProvider.nextPage();
        timer.cancel();
      }
    });
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
    final startWorkoutProvider =
        Provider.of<StartWorkoutProvider>(context, listen: false);

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
            widget.exercise.title.toUpperCase(),
            style: AppTexts.darkTextTheme.headlineSmall!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          Consumer(builder: (context, StartWorkoutProvider provider, child) {
            return Text(
              formatSeconds(startWorkoutProvider.currenTime == 0
                  ? widget.seconds - 1
                  : startWorkoutProvider.currenTime - 1),
              style: AppTexts.darkTextTheme.headlineSmall!
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 70),
            );
          }),
          const Spacer(),
          Controller(
            isPaused: isPaused,
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
