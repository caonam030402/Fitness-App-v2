import 'package:fit_ness/themes/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

enum SizeButton { small, medium, large }

class Button extends StatelessWidget {
  final void Function()? onTap;
  final Color backgroundColor;
  final Color textColor;
  final SizeButton size;
  final IconData? icon;
  final String? iconSvg;
  final String title;
  final double width;
  const Button({
    super.key,
    required this.size,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    required this.title,
    this.onTap,
    this.width = double.maxFinite,
    this.icon,
    this.iconSvg,
  });

  @override
  Widget build(BuildContext context) {
    double buttonSize;
    switch (size) {
      case SizeButton.small:
        buttonSize = 8;
        break;
      case SizeButton.medium:
        buttonSize = 12;
        break;
      case SizeButton.large:
        buttonSize = 15;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(buttonSize),
          alignment: Alignment.center,
          width: width,
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: icon != null || iconSvg != null
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              SizedBox(
                width: icon != null || iconSvg != null ? 10 : 0,
              ),
              icon != null ? Icon(icon) : Container(),
              iconSvg != null
                  ? SvgPicture.asset(
                      iconSvg as String,
                      height: 20,
                    )
                  : Container(),
              SizedBox(
                width: icon != null || iconSvg != null ? 10 : 0,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: textColor, fontWeight: FontWeight.w600),
              ),
            ],
          )),
    );
  }
}
