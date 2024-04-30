import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSides),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("👋",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Hello!",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      ).animate().fadeIn(duration: 700.ms).slide(),
                      Image.asset('assets/images/im_coach.png', height: 100)
                          .animate()
                          .fadeIn(duration: 800.ms)
                          .slide(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("I'm your personal coach.Here are some questions to tailor a personalized workout for you.",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w400, fontSize: 19))
                      .animate()
                      .fadeIn(duration: 1000.ms)
                      .slide(),
                ],
              ),
              const Spacer(),
              Button(
                size: SizeButton.large,
                title: "I'M READY",
                onTap: () {
                  context.pushReplacement(PathRoute.infomation_setting);
                },
              ).animate().fadeIn(duration: 1000.ms).slide(),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
