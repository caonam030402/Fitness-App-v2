import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController? controller;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [Icon(FluentIcons.clock_16_regular)],
          title: Text("Blog"),
          titleSpacing: 0,
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.only(left: AppStyles.paddingBothSides),
                height: 250,
                child: ListView.separated(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(
                                AppStyles.borderRadiusCard)),
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Image.network(
                                    fit: BoxFit.fitWidth,
                                    "https://thethaokimthanh.vn/Uploads/images/fitness-la-gi-1.jpg"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Produce UI Resources for Produce UI",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    "Produce UI Resources for Produce UI, Produce UI Resources for Produce UIProduce UI Resources for Produce UIProduce UI Resources for Produce UI",
                                    maxLines: 2,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        width: 15,
                      );
                    },
                    itemCount: 10),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(AppStyles.paddingBothSides),
                child: Row(
                  children: [Text("With Equiment"), Spacer(), Text("All")],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.only(left: AppStyles.paddingBothSides),
                height: 200,
                child: ListView.separated(
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppStyles.borderRadiusCard)),
                        width: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Image.network(
                                    fit: BoxFit.cover,
                                    "https://thethaokimthanh.vn/Uploads/images/fitness-la-gi-1.jpg"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Produce UI Resources for Produce UI",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    "Beginner",
                                    maxLines: 2,
                                    softWrap: true,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        width: 15,
                      );
                    },
                    itemCount: 10),
              )
            ],
          ),
        )
      ],
    );
  }
}
