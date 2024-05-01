import 'package:fit_ness/components/molecules/rule_picker.dart';
import 'package:fit_ness/providers/user_provider.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fit_ness/utilities/caculate_bmi.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class ChooseWeight extends StatelessWidget {
  const ChooseWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSides),
      child: Column(
        children: [_content(context), const MainChoosePickWeight()],
      ),
    );
  }
}

Widget _content(context) {
  return Column(
    children: [
      Text(
        "What's your weight ?",
        style: Theme.of(context).textTheme.headlineMedium,
      ).animate().fadeIn(duration: 500.ms).slide(),
      const SizedBox(
        height: 40,
      ),
      Container(
        padding: const EdgeInsets.all(AppStyles.paddingCard),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
                Radius.circular(AppStyles.borderRadiusCard))),
        child: Row(
          children: [
            Icon(
              FluentIcons.notepad_32_regular,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Flexible(
                child: Text(
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w400),
              softWrap: true,
              "It will help us to adjust the workout that best suits your weight.",
            ))
          ],
        ),
      ).animate().fadeIn(duration: 500.ms).slide(),
      const SizedBox(
        height: 50,
      )
    ],
  );
}

List<RulerRange> ranges = const [
  RulerRange(begin: 100, end: 250),
];

class MainChoosePickWeight extends StatefulWidget {
  const MainChoosePickWeight({super.key});

  @override
  State<MainChoosePickWeight> createState() => _MainChoosePickWeightState();
}

class _MainChoosePickWeightState extends State<MainChoosePickWeight> {
  RulerPickerController? _rulerPickerController;

  @override
  void initState() {
    super.initState();
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    _rulerPickerController = RulerPickerController();
    _rulerPickerController!.value = userProvider.userInfoUpdate.height as num;
  }

  @override
  @override
  void dispose() {
    super.dispose();
    _rulerPickerController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      return Expanded(
        child: Column(
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: userProvider.userInfoUpdate.weight.toString(),
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
              ),
              const TextSpan(
                text: "Kg",
              )
            ])),
            const SizedBox(
              height: 20,
            ),
            RulerPicker(
              onValueChanged: (value) {
                userProvider.updateUser(weight: value as double);
              },
              rulerBackgroundColor: Colors.transparent,
              controller: _rulerPickerController,
              onBuildRulerScaleText: (index, value) {
                return value.toInt().toString();
              },
              ranges: ranges,
              width: MediaQuery.of(context).size.width -
                  AppStyles.paddingBothSides * 2,
              height: 80,
              rulerMarginTop: 8,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(AppStyles.paddingCard),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppStyles.borderRadiusCard),
                  color: Colors.grey.withOpacity(0.1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Current BMI",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        calculateBmi(userProvider.userInfoUpdate.height ?? 100,
                                userProvider.userInfoUpdate.weight ?? 120)
                            .toStringAsFixed(1),
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Text(
                          "Your have a great potenal to get in better shape, move now",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ).animate().fadeIn(duration: 500.ms).slide(),
            const Spacer(),
          ],
        ),
      );
    });
  }
}
