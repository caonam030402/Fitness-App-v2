import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fit_ness/utilities/generate_years.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ChooseBirthYear extends StatelessWidget {
  const ChooseBirthYear({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> years = generateYears(1940, 2020);
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSides),
      child: Column(
        children: [_content(context), _main(context, years)],
      ),
    );
  }
}

Widget _content(context) {
  return Column(
    children: [
      Text(
        "What's your birth year ?",
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
    ],
  );
}

Widget _main(context, List<int> years) {
  return Expanded(
    child: Column(
      children: [
        Expanded(
          child: CupertinoPicker(
            scrollController: FixedExtentScrollController(initialItem: 55),
            itemExtent: 60,
            children: List.generate(years.length, (index) {
              final year = years[index];
              return Center(
                child: Text(year.toString()),
              );
            }),
            onSelectedItemChanged: (index) {},
          ),
        ),
        const SizedBox(
          height: 30,
        ),
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
