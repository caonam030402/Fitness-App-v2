import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CompletedUpdateInfo extends StatelessWidget {
  const CompletedUpdateInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/im_coach.png', height: 100)
            .animate()
            .fadeIn(duration: 800.ms)
            .slide(),
        Text(
          "Greate job your succes",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            "Next, let's tailor a plan to push you to your goals !",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 19,
                  fontWeight: FontWeight.normal,
                ),
          ).animate().fadeIn(duration: 500.ms).slide(),
        ),
      ],
    );
  }
}
