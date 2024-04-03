import 'package:fit_ness/API/workout_classic.api.dart';
import 'package:fit_ness/components/organisms/card_slide_item.dart';
import 'package:fit_ness/components/organisms/card_workout_item.dart';
import 'package:fit_ness/models/workout.model.dart';
import 'package:fit_ness/providers/dark_mode_provider.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: FutureBuilder<List<ClassicWorkout>>(
        future: fetchListClassicWorkout(),
        builder: (context, snapshot) {
          final dataWorkout = snapshot.data;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _headerHome(context),
                _targetHome(context),
                _slideCard(context),
                _workout(context, dataWorkout)
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget _headerHome(BuildContext context) {
  return Consumer(
    builder: (context, ThemeProvider notifier, child) {
      return Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "SUNDAY, MARCH 24",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              Text(
                "HOME WORKOUT",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              notifier.changeTheme();
            },
            child: Icon(notifier.isDark
                ? FluentIcons.weather_sunny_16_filled
                : FluentIcons.brightness_high_16_filled),
          ),
        ],
      );
    },
  );
}

Widget _slideCard(BuildContext context) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const SizedBox(
      height: 15,
    ),
    Text(
      'My Plan',
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontWeight: FontWeight.w600),
    ),
    const SizedBox(
      height: 8,
    ),
    CarouselSlider(
      options: CarouselOptions(height: 260, viewportFraction: 0.92),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return const CardSlideItem();
          },
        );
      }).toList(),
    ),
    const SizedBox(
      height: 20,
    ),
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(FluentIcons.apps_16_filled),
          SizedBox(
            width: 10,
          ),
          Text('Explore All Plans (11)')
        ],
      ),
    )
  ]);
}

Widget _workout(context, List<ClassicWorkout>? dataWorkout) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 20,
      ),
      Text(
        'Classic Workouts',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.w600),
      ),
      const SizedBox(
        height: 10,
      ),
      Column(
          children: dataWorkout != null
              ? List.generate(dataWorkout.length, (index) {
                  final classicWorkout = dataWorkout[index];
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(
                                AppStyles.borderRadiusCard)),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        AppStyles.borderRadiusCard),
                                    child: Image.network(
                                        fit: BoxFit.cover,
                                        "https://img.freepik.com/free-photo/old-grey-wall-background_24837-414.jpg?t=st=1711893133~exp=1711896733~hmac=5de83149d893dcabc646de875ab96669ba2e9c183ccd5508a8381f0291215b0f&w=1380"),
                                  ),
                                ),
                                Positioned(
                                    top: 0,
                                    bottom: 0,
                                    right: 0,
                                    left: 0,
                                    child: Container(
                                      color: Colors.black.withOpacity(0.4),
                                    )),
                                Container(
                                  height: 120,
                                  padding: const EdgeInsets.all(
                                      AppStyles.paddingCard),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppStyles.paddingBothSides)),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${classicWorkout.list.length} workouts',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            classicWorkout.title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    height: 250,
                                    right: 0,
                                    child: Image.network(classicWorkout.image))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppStyles.paddingCard,
                                  vertical: 10),
                              child: Column(
                                  children: List.generate(
                                      classicWorkout.list.length, (index) {
                                final workout = classicWorkout.list[index];
                                return CardWorkoutItem(workout: workout);
                              })),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                })
              : [Container()])
    ],
  );
}

Widget _targetHome(context) {
  return Column(
    children: [
      const SizedBox(
        height: 10,
      ),
      Row(children: [
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(AppStyles.paddingCard),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(AppStyles.borderRadiusCard)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'Day Streak',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 15),
                  ),
                  Text('Personal Best: 1',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey))
                ],
              ),
              const Spacer(),
              const Icon(
                FluentIcons.fire_16_filled,
                color: Colors.orange,
                size: 30,
              )
            ],
          ),
        )),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.all(AppStyles.paddingCard),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(AppStyles.borderRadiusCard)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1/3',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'This week',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 15),
                  ),
                  Text('In Total: 1',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey))
                ],
              ),
              const Spacer(),
              const Icon(
                FluentIcons.calendar_16_filled,
                color: AppColors.primaryColor,
                size: 30,
              )
            ],
          ),
        ))
      ]),
    ],
  );
}
