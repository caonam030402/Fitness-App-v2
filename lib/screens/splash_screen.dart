import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.push(PathRoute.infomation_setting);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const Spacer(),
            SizedBox(
              height: 50,
            ),
            const Text(
              "HOME",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  height: 0,
                  fontWeight: FontWeight.w900),
            ),
            const Text("WORKOUT",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400)),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                        color: Colors.white, fontWeight: FontWeight.w400))
              ],
            ),
            Spacer(),
            SpinKitFadingFour(
              size: 30,
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.white : Colors.white,
                  ),
                );
              },
            ),
            SizedBox(
              height: 50,
            )
          ],
        ).animate().fadeIn(duration: 500.ms),
      ),
    );
  }
}
