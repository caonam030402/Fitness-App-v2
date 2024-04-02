import 'package:fit_ness/themes/app_colors.dart';
import 'package:flutter/material.dart';

enum SizeButton { small, medium, large }

class Button extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final SizeButton size;
  final String title;
  const Button({
    super.key,
    required this.size,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    double _buttonSize;
    switch (size) {
      case SizeButton.small:
        _buttonSize = 8;
        break;
      case SizeButton.medium:
        _buttonSize = 12;
        break;
      case SizeButton.large:
        _buttonSize = 15;
        break;
    }

    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(_buttonSize),
        alignment: Alignment.center,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(30)),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: textColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
