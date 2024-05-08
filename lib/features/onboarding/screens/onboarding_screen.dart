import 'package:carousel_slider/carousel_slider.dart';
import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/components/molecules/sheet.dart';
import 'package:fit_ness/components/organisms/login_sheet.dart';
import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/providers/auth_provider.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1,
              ),
              items: List.generate(introItems.length, (index) {
                final introItem = introItems[index];
                return Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset(fit: BoxFit.cover, introItem.image),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.black.withOpacity(0),
                            Colors.black.withOpacity(0.8)
                          ],
                              begin: AlignmentDirectional.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppStyles.paddingBothSides),
                        child: introItem.widget),
                  ],
                );
              })),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(AppStyles.paddingBothSides),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const SizedBox(
                    height: 60,
                  ),
                  const Spacer(),
                  Button(
                    size: SizeButton.medium,
                    title: "START NOW",
                    onTap: () {
                      context.push(PathRoute.welcome);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey,
                      )),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Container(
                        width: double.infinity,
                        height: 1,
                        color: Colors.grey,
                      )),
                    ],
                  )),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      sheet(
                        context,
                        LoginSheet(
                          onTapLoginWithGoogle: () async {
                            final newAccount = await AuthProvider()
                                .authenticateWithGoogle(context: context);

                            if (newAccount != null) {
                              newAccount
                                  ? context.pushReplacement(
                                      PathRoute.infomation_setting)
                                  : context
                                      .pushReplacement(PathRoute.home_screen);
                            }
                          },
                        ),
                        MediaQuery.of(context).size.height * 0.4,
                      );
                    },
                    child: const Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue with your existing account",
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          FluentIcons.chevron_right_12_regular,
                          size: 17,
                        )
                      ],
                    )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IntroItem {
  final String image;
  final Widget widget;

  IntroItem({required this.image, required this.widget});
}

List<IntroItem> introItems = [
  IntroItem(
    image: "assets/images/im_intro1.png",
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        const Text(
          "#1 Home",
          style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontWeight: FontWeight.w700,
              height: 0),
        ),
        const Text("Workout App",
            style: TextStyle(
                color: Colors.white,
                fontSize: 45,
                height: 0,
                fontWeight: FontWeight.w700)),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Text(
                "LEAP",
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text("FITNESS",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w400))
          ],
        ),
        const Spacer(),
      ],
    )
        .animate()
        .fadeIn(duration: 100.ms)
        .slide(begin: const Offset(-100, 0), end: const Offset(0, 0)),
  ),
  IntroItem(
    image: "assets/images/im_intro2.png",
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        const Text(
          "200M+",
          style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontWeight: FontWeight.w700,
              height: 0),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text("HAPPY USER CHOICE",
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                height: 0,
                fontWeight: FontWeight.w500)),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: List.generate(
              5,
              (index) =>
                  const Icon(FluentIcons.star_12_filled, color: Colors.white)),
        ),
        const Spacer(),
      ],
    )
        .animate()
        .fadeIn(duration: 100.ms)
        .slide(begin: const Offset(-100, 0), end: const Offset(0, 0)),
  ),
  IntroItem(
    image: "assets/images/im_intro3.png",
    widget: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        const Text(
          "200M+",
          style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontWeight: FontWeight.w700,
              height: 0),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text("HAPPY USER CHOICE",
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                height: 0,
                fontWeight: FontWeight.w500)),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: List.generate(
              5,
              (index) =>
                  const Icon(FluentIcons.star_12_filled, color: Colors.white)),
        ),
        const Spacer(),
      ],
    )
        .animate()
        .fadeIn(duration: 100.ms)
        .slide(begin: const Offset(-100, 0), end: const Offset(0, 0)),
  ),
];
