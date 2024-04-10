import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/components/molecules/rule_picker.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fit_ness/utilities/caculate_bmi.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
        "What's your gender ?",
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
        child: const Row(
          children: [
            Icon(
              FluentIcons.lightbulb_16_regular,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Flexible(
              child: Text(
                softWrap: true,
                "Knowing your gender can help us tailor the intensity for you based on different metabolic rates.",
              ),
            )
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
  num currentValue = 50.0;

  @override
  void initState() {
    super.initState();
    _rulerPickerController = RulerPickerController();
    _rulerPickerController!.value = currentValue;
  }

  @override
  @override
  void dispose() {
    super.dispose();
    _rulerPickerController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: currentValue.toString(),
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
              setState(() {
                currentValue = value;
              });
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
                borderRadius: BorderRadius.circular(AppStyles.borderRadiusCard),
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
                      calculateBmi(170, currentValue).toStringAsFixed(1),
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
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
          const Button(
            title: "Next",
            size: SizeButton.large,
          ).animate().fadeIn(duration: 500.ms).slide(),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
