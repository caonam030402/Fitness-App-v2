import 'package:fit_ness/API/workout_classic.api.dart';
import 'package:fit_ness/models/workout.model.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: fetchDetaitWorkout("PLS5_MK8e_MzSNmCQ3_AqbQL1JOM4Yy-_v", "1"),
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
                  slivers: [_appBar(context, workout), _body(context, workout)],
                ),
              ],
            );
          }),
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
    toolbarHeight: kToolbarHeight,
    expandedHeight: 400,
    flexibleSpace: FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      stretchModes: const [StretchMode.zoomBackground],
      background: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const ShapeDecoration(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        child: Image.network(
          workout.image,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget _body(context, Workout workout) {
  return SliverToBoxAdapter(
      child: Column(
    children: [
      Text(
        "Welcome to",
        style: Theme.of(context).textTheme.displayMedium,
      ),
      Text(
        "Our workout club",
        style: Theme.of(context).textTheme.displayLarge,
      ),
      Text(
        "Our workout club",
        style: Theme.of(context).textTheme.displayLarge,
      )
    ],
  ));
}
