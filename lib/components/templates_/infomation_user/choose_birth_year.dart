import 'package:fit_ness/providers/user_provider.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fit_ness/utilities/generate_years.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

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
        child: Row(
          children: [
            Icon(
              FluentIcons.food_cake_12_filled,
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
                "It will help us to adjust the workout that best suits your age group.",
              ),
            )
          ],
        ),
      ).animate().fadeIn(duration: 500.ms).slide(),
    ],
  );
}

Widget _main(context, List<int> years) {
  final UserProvider userProvider =
      Provider.of<UserProvider>(context, listen: false);
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
            onSelectedItemChanged: (index) {
              userProvider.updateUser(age: years[index]);
            },
          ),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    ),
  );
}
