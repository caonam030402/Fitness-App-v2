import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CardWorkoutItem extends StatelessWidget {
  const CardWorkoutItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppStyles.borderRadiusCard),
            child: Image.network(
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                'https://img.freepik.com/free-photo/athletic-shirtless-male-doing-pull-ups-horizontal-bar-gym-club_613910-10253.jpg?w=1380&t=st=1711899246~exp=1711899846~hmac=9a02dd3f773566e98f001f626bbf8df9b82c10a0ac2def3a2a3ec547eb274453'),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Abs - Beginner',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '18 mins',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey),
              )
            ],
          ),
          Spacer(),
          Icon(
            FluentIcons.arrow_circle_right_16_filled,
            color: Colors.grey,
            size: 18,
          )
        ],
      ),
    );
  }
}
