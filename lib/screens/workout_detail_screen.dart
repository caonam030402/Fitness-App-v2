import 'package:fit_ness/API/workout_classic.api.dart';
import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/components/organisms/card_exercise_item.dart';
import 'package:fit_ness/models/workout.model.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:flutter/material.dart';

class WorkoutDetailScreen extends StatelessWidget {
  const WorkoutDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: FutureBuilder(
            future:
                fetchDetaitWorkout("PLS5_MK8e_MzSNmCQ3_AqbQL1JOM4Yy-_v", "1"),
            builder: (context, snapshot) {
              final workout = snapshot.data;
              if (workout == null) {
                return Container();
              }
              return Stack(
                children: [
                  CustomScrollView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      _appBar(context, workout),
                      _bodyWorkoutDetail(context, workout)
                    ],
                  ),
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Padding(
                        padding: EdgeInsets.all(AppStyles.paddingBothSides),
                        child: Button(
                          title: "Start",
                          size: SizeButton.large,
                        )),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

_appBar(context, Workout workout) {
  return SliverAppBar(
    centerTitle: true,
    stretch: true,
    pinned: true,
    floating: true,
    snap: false,
    title: Text(
      '${workout.title.toUpperCase()} ${workout.level.toUpperCase()}',
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    toolbarHeight: kToolbarHeight,
    expandedHeight: 200,
    flexibleSpace: FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      stretchModes: const [StretchMode.zoomBackground],
      background: Image.network(fit: BoxFit.cover, workout.image),
    ),
  );
}

Widget _bodyWorkoutDetail(context, Workout workout) {
  return SliverToBoxAdapter(
      child: Stack(
    children: [
      Container(
          padding: const EdgeInsets.all(AppStyles.paddingBothSides),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(workout.title,
                  style: Theme.of(context).textTheme.headlineLarge),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        workout.level,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'Level',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.grey),
                      )
                    ],
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 1,
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.4)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        workout.time,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'Time',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.grey),
                      )
                    ],
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 1,
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.4)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Abs',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'Focus Area',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w400, color: Colors.grey),
                      )
                    ],
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Exercises',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '(19)',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w300, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: List.generate(workout.exercises.length, (index) {
                  final exercise = workout.exercises[index];
                  return CardExerciseItem(exercise: exercise);
                }),
              )
            ],
          )),
    ],
  ));
}
