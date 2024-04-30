import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/components/molecules/sheet.dart';
import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/providers/auth_provider.dart';
import 'package:fit_ness/services/auth_service.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
                fit: BoxFit.cover,
                "https://img.freepik.com/free-photo/person-doing-indoor-cycling_23-2149270237.jpg?t=st=1712808073~exp=1712811673~hmac=dd00c1bf600d14d89b9e96cf4685d71649f64d648b841558b32338dc9f5de816&w=740"),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Text(
                              "LEAP",
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("FITNESS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                    ],
                  )
                      .animate()
                      .fadeIn(duration: 900.ms)
                      .slide(begin: Offset(-20, 0), end: Offset(0, 0)),
                  const Spacer(),
                  Button(
                    size: SizeButton.medium,
                    title: "START NOW",
                    onTap: () {
                      context.push(PathRoute.infomation_setting);
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
                        _SheetLogin(
                          context,
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

Widget _SheetLogin(BuildContext context) {
  late AuthProvider authProvider =
      Provider.of<AuthProvider>(context, listen: false);
  return Padding(
    padding: const EdgeInsets.all(AppStyles.paddingBothSides),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              "Continue with",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
                child: const Icon(
                  FluentIcons.dismiss_12_filled,
                  size: 13,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Button(
          iconSvg: "assets/svgs/ic_google.svg",
          onTap: () async {
            final newAccount =
                await authProvider.authenticateWithGoogle(context: context);
            newAccount
                ? context.pushReplacement(PathRoute.infomation_setting)
                : context.pushReplacement(PathRoute.home_screen);
          },
          size: SizeButton.large,
          title: "Sign with Google",
          backgroundColor: Colors.grey.withOpacity(0.2),
        ),
        const SizedBox(
          height: 20,
        ),
        const Button(
          size: SizeButton.large,
          title: "Facebook",
          iconSvg: "assets/svgs/ic_facebook.svg",
        ),
        const SizedBox(
          height: 20,
        ),
        const Button(
          iconSvg: "assets/svgs/ic_twitter.svg",
          size: SizeButton.large,
          title: "Twitter",
          backgroundColor: Colors.white,
          textColor: Colors.black,
        )
      ],
    ),
  );
}
