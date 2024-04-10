import 'package:fit_ness/components/templates_/infomation_user/choose_birth_year.dart';
import 'package:fit_ness/components/templates_/infomation_user/choose_gender.dart';
import 'package:fit_ness/components/templates_/infomation_user/choose_height.dart';
import 'package:fit_ness/components/templates_/infomation_user/choose_weight.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class InfomationSetting extends StatelessWidget {
  const InfomationSetting({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 9,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppStyles.paddingBothSides),
              child: Row(
                children: [
                  const Icon(FluentIcons.chevron_left_12_filled),
                  const Spacer(),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text("01",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: AppColors.primaryColor)),
                          SizedBox(
                            width: 5,
                          ),
                          Text("FITNESS ASSESSMENT",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SmoothPageIndicator(
                          controller: controller,
                          count: 10,
                          effect: const ExpandingDotsEffect(
                              dotHeight: 5,
                              dotWidth: 10,
                              activeDotColor: AppColors.primaryColor),
                          onDotClicked: (index) {}),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    FluentIcons.chevron_left_12_filled,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: PageView(
                controller: controller,
                children: const [
                  ChooseGender(),
                  ChooseBirthYear(),
                  ChooseHeight(),
                  ChooseWeight(),
                ],
              ),
            ),
          ],
        ));
  }
}
