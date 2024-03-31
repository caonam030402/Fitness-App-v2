import 'package:fit_ness/components/card-slide-item.dart';
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
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
            ),
            SizedBox(
              height: 10,
            ),
            CarouselSlider(
              options: CarouselOptions(height: 260, viewportFraction: 0.92),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return CardSlideItem();
                  },
                );
              }).toList(),
            )
          ],
        );
      },
    );
  }
}
