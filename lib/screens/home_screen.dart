import 'package:fit_ness/API/workout_classic.api.dart';
import 'package:fit_ness/components/organisms/card_slide_item.dart';
import 'package:fit_ness/components/organisms/card_workout_item.dart';
import 'package:fit_ness/models/workout.model.dart';
import 'package:fit_ness/providers/dark_mode_provider.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ClassicWorkout>>(
      future: fetchListClassicWorkout(),
      builder: (context, snapshot) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerHome(context),
              _slideCard(context),
              _workout(context)
            ],
          ),
        );
      },
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
      height: 10,
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

Widget _workout(context) {
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
      Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(AppStyles.borderRadiusCard)),
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
                    borderRadius:
                        BorderRadius.circular(AppStyles.borderRadiusCard),
                    child: Image.network(
                        fit: BoxFit.cover,
                        "https://img.freepik.com/free-photo/old-grey-wall-background_24837-414.jpg?t=st=1711893133~exp=1711896733~hmac=5de83149d893dcabc646de875ab96669ba2e9c183ccd5508a8381f0291215b0f&w=1380"),
                  ),
                ),
                Container(
                  height: 120,
                  padding: const EdgeInsets.all(AppStyles.paddingCard),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppStyles.paddingBothSides)),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '5 workouts',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Beginner',
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
                    height: 200,
                    right: 0,
                    child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/webecommerce-b9bf2.appspot.com/o/fitness%2Fs%E1%BA%A5gag.png?alt=media&token=14e59698-bdbb-4ce3-8679-33c91a5aa58f"))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingCard),
              child: Column(children: [
                CardWorkoutItem(),
                Divider(
                  thickness: 0.2,
                ),
                CardWorkoutItem(),
                Divider(
                  thickness: 0.2,
                ),
                CardWorkoutItem(),
              ]),
            )
          ],
        ),
      )
    ],
  );
}
