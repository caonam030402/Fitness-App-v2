import 'dart:async';

import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/models/workout.model.dart';
import 'package:fit_ness/providers/start_workout_provider.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fit_ness/themes/app_texts.dart';
import 'package:fit_ness/utilities/format_time.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutIntroNext extends StatefulWidget {
  final Exercise exercise;
  final int index;
  final int listLenght;
  const WorkoutIntroNext(
      {super.key,
      required this.exercise,
      required this.index,
      required this.listLenght});

  @override
  State<WorkoutIntroNext> createState() => _WorkoutIntroNextState();
}

class _WorkoutIntroNextState extends State<WorkoutIntroNext> {
  late StartWorkoutProvider startWorkoutProvider;
  int _countdownSeconds = 25;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
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
          startWorkoutProvider.updateIntro();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          const Spacer(),
          Text(
            "Rest",
            style: AppTexts.darkTextTheme.bodyLarge!
                .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            formatSeconds(_countdownSeconds),
            style: AppTexts.darkTextTheme.bodyLarge!
                .copyWith(fontSize: 80, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                size: SizeButton.small,
                onTap: () {
                  setState(() {
                    _countdownSeconds += 20;
                  });
                },
                title: "+20s",
                width: 120,
                backgroundColor: Colors.white24,
              ),
              SizedBox(
                width: 30,
              ),
              Button(
                size: SizeButton.small,
                backgroundColor: Colors.white,
                textColor: AppColors.primaryColor,
                title: "Skip",
                onTap: () {
                  startWorkoutProvider.updateIntro();
                },
                width: 120,
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(AppStyles.paddingBothSides),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next ${widget.index + 1}/${widget.listLenght}",
                      style: AppTexts.darkTextTheme.bodyLarge!
                          .copyWith(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      widget.exercise.title,
                      style: AppTexts.darkTextTheme.bodyLarge!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
                Text(
                  formatSeconds(widget.exercise.fitTime),
                  style: AppTexts.darkTextTheme.bodyLarge!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.w800),
                )
              ],
            ),
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
                fit: BoxFit.cover,
                "https://img.freepik.com/free-photo/athletic-shirtless-male-doing-pull-ups-horizontal-bar-gym-club_613910-10253.jpg?t=st=1711905910~exp=1711909510~hmac=a1fadf7cadd3cf79e95248a926665fb6854426709f013f9215771f39446ee196&w=1380"),
          )
        ]),
      ),
    );
  }
}
