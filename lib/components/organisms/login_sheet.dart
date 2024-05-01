import 'package:fit_ness/components/atoms/button.dart';
import 'package:fit_ness/constants/path_routes.dart';
import 'package:fit_ness/providers/auth_provider.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LoginSheet extends StatelessWidget {
  final void Function()? onTapLoginWithGoogle;
  const LoginSheet({super.key, this.onTapLoginWithGoogle});

  @override
  Widget build(BuildContext context) {
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
            onTap: onTapLoginWithGoogle,
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
}
