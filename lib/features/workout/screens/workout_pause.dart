import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/providers/start_workout_provider.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fit_ness/themes/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class WorkoutPause extends StatelessWidget {
  const WorkoutPause({super.key});

  @override
  Widget build(BuildContext context) {
    final startWorkoutProvider =
        Provider.of<StartWorkoutProvider>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0.3),
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.9),
            Colors.white,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppStyles.paddingBothSides),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Spacer(),
              Text("Hold on!",
                  style: AppTexts.lightTextTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 30)),
              Text("You can do it!",
                  style: AppTexts.lightTextTheme.headlineSmall!
                      .copyWith(fontWeight: FontWeight.w700, fontSize: 30)),
              const SizedBox(
                height: 10,
              ),
              Text("You hava finished 0%",
                  style: AppTexts.lightTextTheme.headlineSmall!
                      .copyWith(fontSize: 18)),
              Text("Only 15 exercises left",
                  style: AppTexts.lightTextTheme.headlineSmall!
                      .copyWith(fontSize: 18)),
              const SizedBox(
                height: 30,
              ),
              Button(
                size: SizeButton.large,
                title: "Resume",
                onTap: () {
                  startWorkoutProvider.openModalPause();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Button(
                  textColor: Colors.black,
                  backgroundColor: Colors.grey.shade300,
                  size: SizeButton.large,
                  title: "Restart this exercies",
                  onTap: () {
                    startWorkoutProvider.updateTime(15);
                    startWorkoutProvider.openModalPause();
                  }),
              const SizedBox(
                height: 10,
              ),
              Button(
                  textColor: Colors.black,
                  backgroundColor: Colors.grey.withOpacity(0),
                  size: SizeButton.large,
                  title: "Quit",
                  onTap: () {
                    context.push(PathRoute.home_screen);
                  }),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
