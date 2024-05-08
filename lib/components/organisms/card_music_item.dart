import 'package:fit_ness/DB/list_music.db.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CardMusicItem extends StatelessWidget {
  final Music music;
  final bool active;
  const CardMusicItem({super.key, this.active = false, required this.music});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            const Icon(
              FluentIcons.navigation_24_regular,
              size: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          active ? AppColors.primaryColor : Colors.transparent,
                      width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(
                    10,
                  ))),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(
                  10,
                ))),
                width: 60,
                height: 60,
                child: Image.network(music.imageUrl),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  music.name,
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
                Text(
                  music.duration,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey),
                )
              ],
            ),
            const Spacer(),
            Container(
              width: 26,
              height: 26,
              child: !active
                  ? Icon(
                      FluentIcons.play_12_filled,
                      size: 13,
                    )
                  : Icon(
                      FluentIcons.checkmark_12_regular,
                      size: 15,
                    ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: active
                      ? AppColors.primaryColor
                      : Colors.grey.withOpacity(0.2)),
            )
          ],
        ),
      ),
    );
  }
}
