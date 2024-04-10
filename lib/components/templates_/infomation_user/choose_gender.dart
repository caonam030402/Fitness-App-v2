import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ChooseGender extends StatelessWidget {
  const ChooseGender({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSides),
      child: Column(
        children: [_content(context), _main(context)],
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

Widget _main(context) {
  return Expanded(
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
                child: GestureDetector(
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppStyles.borderRadiusCard),
                    color: Colors.grey.withOpacity(0.1)),
                child: Column(
                  children: [
                    Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/ecommerce-67575.appspot.com/o/123123124512%20(1)111.png?alt=media&token=417b081b-e82e-4dce-820a-5e9a394e48db"),
                    Text(
                      "Male",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
                child: Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppStyles.borderRadiusCard),
                  color: Colors.grey.withOpacity(0.1)),
              child: Column(
                children: [
                  Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/ecommerce-67575.appspot.com/o/123123124512%20(1)111.png?alt=media&token=417b081b-e82e-4dce-820a-5e9a394e48db"),
                  Text(
                    "Female",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey.withOpacity(0.1)),
          child: Text(
            "Orthers/I'd rather not say",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ).animate().fadeIn(duration: 500.ms).slide(),
        const Spacer(),
        Button(
          title: "Next",
          size: SizeButton.large,
        ).animate().fadeIn(duration: 500.ms).slide(),
        SizedBox(
          height: 30,
        ),
      ],
    ),
  );
}
