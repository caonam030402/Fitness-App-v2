import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/components/molecules/sheet.dart';
import 'package:fit_ness/components/organisms/login_sheet.dart';
import 'package:fit_ness/components/templates_/infomation_user/choose_birth_year.dart';
import 'package:fit_ness/components/templates_/infomation_user/choose_gender.dart';
import 'package:fit_ness/components/templates_/infomation_user/choose_height.dart';
import 'package:fit_ness/components/templates_/infomation_user/choose_weight.dart';
import 'package:fit_ness/components/templates_/infomation_user/feedback.dart';
import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/providers/auth_provider.dart';
import 'package:fit_ness/services/auth_service.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fit_ness/components/templates_/infomation_user/completed_update_info.dart';

const listScreen = [
  ChooseGender(),
  ChooseBirthYear(),
  ChooseHeight(),
  ChooseWeight(),
  UserFeedback(),
  CompletedUpdateInfo(),
];

class InfomationSetting extends StatelessWidget {
  const InfomationSetting({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    // print(currentPage);
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
                  GestureDetector(
                    child: const Icon(FluentIcons.chevron_left_12_filled),
                    onTap: () {
                      int currentPage = controller.page?.round() ?? 0;
                      bool isFirstPage = currentPage == 0;
                      if (isFirstPage) {
                        context.pushReplacement(PathRoute.onboarding);
                        return;
                      }
                      controller.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.linear);
                    },
                  ),
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
                          const SizedBox(
                            width: 5,
                          ),
                          Text("FITNESS ASSESSMENT",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SmoothPageIndicator(
                          controller: controller,
                          count: listScreen.length,
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
                children: listScreen,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppStyles.paddingBothSides),
              child: Button(
                onTap: () {
                  int currentPage = controller.page?.round() ?? 0;
                  bool isLastPage = currentPage == listScreen.length - 1;
                  if (isLastPage) {
                    final idUser = AuthService.user?.uid;

                    if (idUser != null) {
                      context.pushReplacement(PathRoute.synchronize_info);
                    }

                    sheet(
                      context,
                      LoginSheet(
                        onTapLoginWithGoogle: () async {
                          final newAccount = await AuthProvider()
                              .authenticateWithGoogle(context: context);
                          context.pushReplacement(PathRoute.synchronize_info);
                        },
                      ),
                      MediaQuery.of(context).size.height * 0.4,
                    );
                  }

                  controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.linear);
                },
                title: "Next",
                size: SizeButton.large,
              ).animate().fadeIn(duration: 500.ms).slide(),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ));
  }
}
