import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/models/workout.model.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardWorkoutItem extends StatelessWidget {
  final Workout workout;
  const CardWorkoutItem({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(PathRoute.workout_detail, extra: workout.id);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppStyles.borderRadiusCard),
                  child: Image.network(
                      width: 80, height: 80, fit: BoxFit.cover, workout.image),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${workout.title} - ${workout.level}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      workout.time,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey),
                    )
                  ],
                ),
                const Spacer(),
                const Icon(
                  FluentIcons.arrow_circle_right_16_filled,
                  color: Colors.grey,
                  size: 18,
                )
              ],
            ),
          ),
          const Divider(
            thickness: 0.1,
          )
        ],
      ),
    );
  }
}
