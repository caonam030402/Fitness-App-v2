import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkoutSetting extends StatelessWidget {
  const WorkoutSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              "Workout Settings",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppStyles.paddingBothSides),
                child: GestureDetector(
                  onTap: () {
                    context.push(
                        "${PathRoute.workout_setting}/${PathRoute.choose_coach}");
                  },
                  child: Row(
                    children: [
                      Text(
                        "Coach Video",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const Spacer(),
                      Container(
                        width: 38,
                        height: 38,
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.network(
                            fit: BoxFit.cover,
                            "https://hips.hearstapps.com/hmg-prod/images/mh-trainer-2-1533576998.png"),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const Icon(
                        FluentIcons.chevron_right_16_regular,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
