import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/providers/user_provider.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class ChooseGender extends StatefulWidget {
  const ChooseGender({super.key});

  @override
  State<ChooseGender> createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  int selectedCardIndex = -1;

  void updateUserGender(String gender) {
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    userProvider.updateUser(gender: gender);
  }

  void handleCardTap(int index, String value) {
    setState(() {
      selectedCardIndex = index;
    });
    updateUserGender(value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSides),
      child: Column(
        children: [
          _content(context),
          _main(context, selectedCardIndex, handleCardTap)
        ],
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

Widget _main(context, int selectedCardIndex, handleCardTap) {
  return Expanded(
    child: Column(
      children: [
        Row(children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              handleCardTap(0, "Male");
            },
            child: Stack(
              children: [
                Container(
                  height: 320,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: selectedCardIndex == 0
                              ? AppColors.primaryColor
                              : AppColors.primaryColor.withOpacity(0)),
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
                selectedCardIndex == 0
                    ? Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          width: 23,
                          height: 23,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: const Icon(
                            FluentIcons.checkmark_12_filled,
                            size: 15,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          )),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {
              handleCardTap(1, "Female");
            },
            child: Stack(
              children: [
                Container(
                  height: 320,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedCardIndex == 1
                            ? AppColors.primaryColor
                            : AppColors.primaryColor.withOpacity(0),
                      ),
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
                selectedCardIndex == 1
                    ? Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          width: 23,
                          height: 23,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: const Icon(
                            FluentIcons.checkmark_12_filled,
                            size: 15,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          )),
        ]),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            handleCardTap(2, "Other");
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
                border: selectedCardIndex != 2
                    ? null
                    : Border.all(color: Colors.grey),
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
        ),
        const Spacer(),
      ],
    ),
  );
}

const listGender = [
  {
    "name": "Male",
    "image":
        "https://firebasestorage.googleapis.com/v0/b/ecommerce-67575.appspot.com/o/123123124512%20(1)111.png?alt=media&token=417b081b-e82e-4dce-820a-5e9a394e48db"
  },
  {
    "name": "Female",
    "image":
        "https://firebasestorage.googleapis.com/v0/b/ecommerce-67575.appspot.com/o/123123124512%20(1)111.png?alt=media&token=417b081b-e82e-4dce-820a-5e9a394e48db"
  }
];
