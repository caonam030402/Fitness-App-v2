import 'package:fit_ness/components/molecules/controller.dart';
import 'package:fit_ness/components/molecules/count_down_time.dart';
import 'package:fit_ness/components/templates_/time_ready_to_go.dart';
import 'package:fit_ness/providers/time_provider.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fit_ness/themes/app_texts.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartWorkoutScreen extends StatefulWidget {
  const StartWorkoutScreen({super.key});

  @override
  State<StartWorkoutScreen> createState() => _StartWorkoutScreenState();
}

class _StartWorkoutScreenState extends State<StartWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [const TimeReadyToGo(), _body(context)],
        ),
      ),
    );
  }
}

Widget _body(BuildContext context) {
  return SizedBox(
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
        Consumer(builder: (context, TimeReadyToGoProvider notifier, child) {
          return notifier.isTimeUp
              ? Container(
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
                      const CountDownTime(
                        seconds: 100,
                      ),
                      const Spacer(),
                      const Controller(
                        time: 4,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                )
              : Container();
        })
      ],
    ),
  );
}
