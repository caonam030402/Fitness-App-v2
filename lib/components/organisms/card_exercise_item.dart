import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/models/workout.model.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardExerciseItem extends StatelessWidget {
  final Exercise exercise;
  const CardExerciseItem({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _sheetDetailExercise(context, exercise);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
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
                const SizedBox(
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
                const Spacer(),
                // Icon(
                //   FluentIcons.arrow_circle_right_16_filled,
                //   color: Colors.grey,
                //   size: 18,
                // )
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

Future _sheetDetailExercise(BuildContext context, Exercise exercise) {
  return showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: Theme.of(context).bottomSheetTheme.backgroundColor,
    barrierColor: Colors.black38,
    shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    context: context,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  toolbarHeight: 30,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  backgroundColor: Colors.transparent,
                  title: Text(
                    exercise.title.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppStyles.paddingBothSides),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "INSTRUCTIONS",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: AppColors.primaryColor,
                                  ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          exercise.description,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          exercise.images[1],
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                        ),
                        Image.network(
                          exercise.images[1],
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                        ),
                        Image.network(
                          exercise.images[1],
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                        ),
                        Image.network(
                          exercise.images[1],
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                  padding: EdgeInsets.all(AppStyles.paddingBothSides),
                  child: Button(
                    title: "Close",
                    size: SizeButton.large,
                  )),
            ),
          ],
        ),
      );
    },
  );
}
