import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/providers/start_workout_provider.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:flutter/material.dart';
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
        child: Column(
          children: [
            Text("Hold on !"),
            Text("You can do it !"),
            Text("You hava finished 0%"),
            Text("Only 15 exercises left"),
            Button(
              size: SizeButton.medium,
              title: "Resume",
              onTap: () {
                startWorkoutProvider.openModalPause();
              },
            ),
            Button(
                size: SizeButton.medium,
                title: "Restart this exercies",
                onTap: () {}),
            Text("Quit")
          ],
        ),
      ),
    );
  }
}
