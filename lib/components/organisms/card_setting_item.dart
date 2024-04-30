import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardSettingItem extends StatelessWidget {
  final IconData? icon;
  final String name;
  final Color? color;
  const CardSettingItem(
      {super.key, required this.icon, required this.name, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(PathRoute.workout_setting);
      },
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSides),
        color: Colors.grey.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: color ?? AppColors.primaryColor),
                child: Icon(
                  icon ?? FluentIcons.heart_12_filled,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              const Icon(
                FluentIcons.chevron_right_16_regular,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
