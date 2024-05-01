import 'package:fit_ness/API/user.api.dart';
import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/providers/user_provider.dart';
import 'package:fit_ness/services/auth_service.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class SynchronizeInfo extends StatefulWidget {
  const SynchronizeInfo({super.key});

  @override
  State<SynchronizeInfo> createState() => _SynchronizeInfoState();
}

class _SynchronizeInfoState extends State<SynchronizeInfo> {
  double percentValue = 0;
  final maxValue = 1.0000000000000007;

  @override
  void initState() {
    super.initState();
    // Start animation to update percentValue
    animatePercent();
  }

  void animatePercent() {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        percentValue += 0.01;
        if (percentValue < maxValue) {
          animatePercent();
        } else {
          final userProvider =
              Provider.of<UserProvider>(context, listen: false).userInfoUpdate;
          Future.delayed(
            const Duration(seconds: 3),
            () {
              final idUser = AuthService.user?.uid;
              final body = userProvider;

              updateUserAPI(body: body, id: idUser as String, context: context);
              context.pushReplacement(PathRoute.home_screen);
            },
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/im_coach.png', height: 170)
                        .animate()
                        .fadeIn(duration: 800.ms)
                        .slide(),
                    percentValue == maxValue
                        ? Animate(
                            effects: const [
                              FadeEffect(),
                              ScaleEffect(duration: Duration(seconds: 1))
                            ],
                            child: Positioned(
                              right: 20,
                              top: 20,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(100)),
                                child:
                                    const Icon(FluentIcons.checkmark_12_filled),
                              ),
                            ),
                          )
                        : Container()
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  'Your coach is busy working for you...',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: LinearPercentIndicator(
                    animation: true,
                    lineHeight: 40.0,
                    animationDuration: 10000,
                    percent: 1,
                    center: Text(
                      "${(percentValue * 100).toStringAsFixed(0)}%",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    barRadius: const Radius.circular(30),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: AppColors.primaryColor,
                    backgroundColor: Colors.grey.withOpacity(0.3),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
