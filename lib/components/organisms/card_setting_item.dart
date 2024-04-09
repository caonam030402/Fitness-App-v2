import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CardSettingItem extends StatelessWidget {
  final IconData? icon;
  final String name;
  final Color? color;
  const CardSettingItem(
      {super.key, required this.icon, required this.name, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSides),
      color: Colors.grey.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
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
            SizedBox(
              width: 10,
            ),
            Text(
              name ?? "My Proifile",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer(),
            Icon(
              FluentIcons.chevron_right_16_regular,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
