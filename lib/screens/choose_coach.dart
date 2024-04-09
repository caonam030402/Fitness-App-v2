import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChooseCoach extends StatefulWidget {
  const ChooseCoach({super.key});

  @override
  State<ChooseCoach> createState() => _ChooseCoachState();
}

class _ChooseCoachState extends State<ChooseCoach> {
  String selectItem = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Colors.white.withOpacity(0.8),
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.all(AppStyles.paddingBothSides),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.7),
                              shape: BoxShape.circle),
                          child: const Icon(
                            FluentIcons.dismiss_12_regular,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppStyles.paddingBothSides),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Choose your guide',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Professional and multi-angle coach demonsstraions can help you master all the esntials of exercise',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 15,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: listCoach.length,
                        itemBuilder: (context, index) {
                          final coach = listCoach[index];
                          final isActiveCard =
                              selectItem == "${coach.sex} ${coach.type}";
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectItem = "${coach.sex} ${coach.type}";
                              });
                            },
                            child: Stack(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 5, top: 5),
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: isActiveCard
                                                ? AppColors.primaryColor
                                                : Colors.transparent,
                                            width: 2),
                                        color: isActiveCard
                                            ? AppColors.primaryColor
                                            : Colors.grey.withOpacity(0.3),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    width: 120,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 150,
                                          child: Image.network(
                                            coach.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          coach.sex,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        Text(
                                          coach.type,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: isActiveCard
                                      ? Container(
                                          padding: const EdgeInsets.all(2),
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.primaryColor),
                                          child: const Icon(
                                            FluentIcons.checkmark_12_regular,
                                            size: 15,
                                          ))
                                      : Container(),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    const Button(size: SizeButton.large, title: "Save"),
                    const SizedBox(
                      height: AppStyles.paddingBothSides,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class Coach {
  final String type;
  final String sex;
  final String image;

  Coach({required this.type, required this.sex, required this.image});
}

final List<Coach> listCoach = [
  Coach(
      sex: "Male",
      type: "Pro Coach",
      image:
          "https://hips.hearstapps.com/hmg-prod/images/mh-trainer-2-1533576998.png"),
  Coach(
      sex: "Female",
      type: "Pro Coach",
      image:
          "https://hips.hearstapps.com/hmg-prod/images/mh-trainer-2-1533576998.png"),
  Coach(
      sex: "Male",
      type: "3D",
      image:
          "https://hips.hearstapps.com/hmg-prod/images/mh-trainer-2-1533576998.png"),
  Coach(
      sex: "Female",
      type: "3D",
      image:
          "https://hips.hearstapps.com/hmg-prod/images/mh-trainer-2-1533576998.png")
];
