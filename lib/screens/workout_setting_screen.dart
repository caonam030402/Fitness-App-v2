import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/components/molecules/sheet.dart';
import 'package:fit_ness/components/organisms/card_music_item.dart';
import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkoutSettingScreen extends StatelessWidget {
  const WorkoutSettingScreen({super.key});

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
              _chosseCoach(context),
              const SizedBox(
                height: 15,
              ),
              _controlMusic(context),
              const SizedBox(
                height: 15,
              ),
              _restartAll(context)
            ],
          ))
        ],
      ),
    );
  }
}

Widget _chosseCoach(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(AppStyles.paddingBothSides),
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppStyles.borderRadiusCard)),
    child: GestureDetector(
      onTap: () {
        context.push("${PathRoute.workout_setting}/${PathRoute.choose_coach}");
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
            width: 8,
          ),
          const Icon(
            FluentIcons.chevron_right_16_regular,
            color: Colors.grey,
            size: 20,
          ),
        ],
      ),
    ),
  );
}

Widget _controlMusic(context) {
  return Container(
    padding: const EdgeInsets.all(AppStyles.paddingBothSides),
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppStyles.borderRadiusCard)),
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              _sheetDetailMusic(context);
            },
            child: Row(
              children: [
                Text(
                  "Music",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                Container(
                  width: 30,
                  height: 30,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.network(
                      fit: BoxFit.cover,
                      "https://hips.hearstapps.com/hmg-prod/images/mh-trainer-2-1533576998.png"),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("Power of Fire"),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  FluentIcons.chevron_right_16_regular,
                  size: 20,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(FluentIcons.speaker_0_48_regular),
              Expanded(
                child: Slider(
                  thumbColor: Colors.white,
                  value: 20,
                  max: 100,
                  onChanged: (value) {},
                ),
              ),
              const Icon(FluentIcons.speaker_2_48_regular),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _restartAll(context) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(AppStyles.paddingBothSides),
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppStyles.borderRadiusCard)),
    child: GestureDetector(
        onTap: () {
          context
              .push("${PathRoute.workout_setting}/${PathRoute.choose_coach}");
        },
        child: Text(
          'Restart all progress',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.red),
        )),
  );
}

_sheetDetailMusic(BuildContext context) {
  sheet(
      context,
      Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSides),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Music",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Spacer(),
                Switch(
                  value: true,
                  onChanged: (value) {},
                )
              ],
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CardMusicItem(
                        active: index == 0 ? true : false,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container();
                    },
                    itemCount: 10)),
            Button(
              size: SizeButton.large,
              title: "Done",
              onTap: () {
                context.pop();
              },
            ),
            SizedBox(
              height: AppStyles.paddingBothSides,
            )
          ],
        ),
      ));
}
