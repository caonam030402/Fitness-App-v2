import 'package:fit_ness/components/molecules/card-slide-item.dart';
import 'package:fit_ness/providers/dark_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThemeProvider notifier, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerHome(context, notifier),
            _slideCard(context, notifier)
          ],
        );
      },
    );
  }
}

Widget _headerHome(BuildContext context, ThemeProvider notifier) {
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
}

Widget _slideCard(BuildContext context, ThemeProvider notifier) {
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

Widget _workout() {
  return Container(
      child: Column(
    children: [
      Container(
        child: Row(
          children: [
            Column(
              children: [Text('5 workouts')],
            )
          ],
        ),
      )
    ],
  ));
}
