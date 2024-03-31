import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_texts.dart';
import 'package:flutter/material.dart';

class CardSlideItem extends StatelessWidget {
  const CardSlideItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(
            horizontal: 5.0,
          ),
          decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Stack(
            children: [
              Positioned(
                  left: 130,
                  top: 0,
                  child: Image.network(
                      height: 320,
                      width: 320,
                      "https://firebasestorage.googleapis.com/v0/b/webecommerce-b9bf2.appspot.com/o/fitness%2Fs%E1%BA%A5gag.png?alt=media&token=14e59698-bdbb-4ce3-8679-33c91a5aa58f")),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "7x4 PLAN",
                      style: AppTexts.darkTextTheme.bodySmall,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 200,
                      child: Text(
                        'MASSIVE UPPER BODY',
                        style: AppTexts.darkTextTheme.headlineLarge!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      maxLines: 3,
                      "This method will save memory by building items once it becomes necessary. This way they won't be built if they're not currently meant to be visible on screen. It can be used to build different child item widgets related to content or by item index.",
                      style: AppTexts.darkTextTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Button()
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            )),
      ],
    );
  }
}
