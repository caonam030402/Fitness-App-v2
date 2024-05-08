import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkoutCompleted extends StatelessWidget {
  const WorkoutCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            CustomScrollView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              slivers: [_appBar(context), _body(context)],
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(AppStyles.paddingBothSides),
                  child: Button(
                    size: SizeButton.large,
                    title: "FINISH",
                    onTap: () {
                      context.push(PathRoute.workout_detail);
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

Widget _body(context) {
  return SliverToBoxAdapter(
    child: Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSides),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "WORKOUT COMPLETED",
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "ABS - BEGINNER",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("16",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 35)),
                  Text("Exercises",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.grey))
                ],
              ),
              const Spacer(),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey.withOpacity(0.5),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("100",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 35)),
                  Text("Calories",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.grey))
                ],
              ),
              const Spacer(),
              Container(
                height: 50,
                width: 1,
                color: Colors.grey.withOpacity(0.5),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("0:23",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.w800, fontSize: 35)),
                  Text("Duration",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500, color: Colors.grey))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.5),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "How do you feel",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.1)),
                    child: const Center(
                      child: Icon(
                        FluentIcons.battery_1_20_filled,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hard",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.1)),
                    child: const Center(
                      child: Icon(
                        FluentIcons.battery_1_20_filled,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hard",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.1)),
                    child: const Center(
                      child: Icon(
                        FluentIcons.battery_1_20_filled,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hard",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

_appBar(context) {
  return SliverAppBar(
    centerTitle: true,
    leading: Container(),
    stretch: true,
    pinned: true,
    floating: true,
    snap: false,
    actions: [
      Container(
        padding:
            const EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSides),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(130))),
              child: Row(
                children: [
                  const Icon(
                    FluentIcons.share_16_regular,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "SHARE",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w800),
                  )
                ],
              ),
            )
          ],
        ),
      )
    ],
    toolbarHeight: kToolbarHeight,
    expandedHeight: 230,
    flexibleSpace: Stack(
      children: [
        FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          stretchModes: const [StretchMode.zoomBackground],
          background: Image.network(
            "https://img.freepik.com/free-photo/athletic-shirtless-male-doing-pull-ups-horizontal-bar-gym-club_613910-10253.jpg?t=st=1711905910~exp=1711909510~hmac=a1fadf7cadd3cf79e95248a926665fb6854426709f013f9215771f39446ee196&w=1380",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Theme.of(context).primaryColorDark, Colors.transparent],
            ),
          ),
        ),
      ],
    ),
  );
}
