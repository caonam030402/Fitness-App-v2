import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/models/workout.model.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardExerciseItem extends StatelessWidget {
  final Exercise exercise;
  const CardExerciseItem({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(PathRoute.workout_detail);
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppStyles.borderRadiusCard),
                  child: Image.network(
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      exercise.images[1]),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.title.toUpperCase(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      exercise.fitTime.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.grey),
                    )
                  ],
                ),
                Spacer(),
                // Icon(
                //   FluentIcons.arrow_circle_right_16_filled,
                //   color: Colors.grey,
                //   size: 18,
                // )
              ],
            ),
          ),
          Divider(
            thickness: 0.1,
          )
        ],
      ),
    );
  }
}
