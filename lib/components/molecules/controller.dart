import 'package:fit_ness/providers/start_workout_provider.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Controller extends StatelessWidget {
  final bool isPaused;
  final int time;

  const Controller({
    super.key,
    required this.time,
    required this.isPaused,
  });

  @override
  Widget build(BuildContext context) {
    const withButton = 150;

    final percent = time != 0 ? withButton / time : withButton;

    return Consumer(builder: (context, StartWorkoutProvider provider, child) {
      final startWorkoutProvider =
          Provider.of<StartWorkoutProvider>(context, listen: false);
      return Row(
        children: [
          const Spacer(),
          GestureDetector(
            onTap: () {
              provider.prevPage();
            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white.withOpacity(0.2)),
              width: 55,
              height: 55,
              child: const Center(
                child: Icon(
                  FluentIcons.previous_24_filled,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              startWorkoutProvider.openModalPause();
            },
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: 150,
              height: 55,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.8),
                  borderRadius: const BorderRadius.all(Radius.circular(100))),
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(100))),
                    width: percent as double,
                    height: 55,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    width: 150,
                    height: 55,
                    child: const Center(
                      child: Icon(
                        FluentIcons.pause_12_filled,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              provider.nextPage();
            },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white.withOpacity(0.2)),
              width: 55,
              height: 55,
              child: const Center(
                child: Icon(
                  FluentIcons.next_16_filled,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      );
    });
  }
}
