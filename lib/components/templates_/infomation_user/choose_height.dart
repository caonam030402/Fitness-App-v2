import 'package:fit_ness/components/molecules/rule_picker.dart';
import 'package:fit_ness/providers/user_provider.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fit_ness/utilities/caculate_bmi.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class ChooseHeight extends StatelessWidget {
  const ChooseHeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSides),
      child: Column(
        children: [_content(context), const MainChoosePickWeight()],
      ),
    );
  }
}

Widget _content(context) {
  return Column(
    children: [
      Text(
        "What's your height ?",
        style: Theme.of(context).textTheme.headlineMedium,
      ).animate().fadeIn(duration: 500.ms).slide(),
      const SizedBox(
        height: 40,
      ),
      Container(
        padding: const EdgeInsets.all(AppStyles.paddingCard),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
                Radius.circular(AppStyles.borderRadiusCard))),
        child: Row(
          children: [
            Icon(
              FluentIcons.notebook_lightning_24_filled,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Flexible(
              child: Text(
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w400),
                softWrap: true,
                "It will help us to adjust the workout that best suits your height.",
              ),
            )
          ],
        ),
      ).animate().fadeIn(duration: 500.ms).slide(),
      const SizedBox(
        height: 50,
      )
    ],
  );
}

List<RulerRange> ranges = const [
  RulerRange(begin: 80, end: 200),
];

class MainChoosePickWeight extends StatefulWidget {
  const MainChoosePickWeight({super.key});

  @override
  State<MainChoosePickWeight> createState() => _MainChoosePickWeightState();
}

class _MainChoosePickWeightState extends State<MainChoosePickWeight> {
  RulerPickerController? _rulerPickerController;

  @override
  void initState() {
    super.initState();
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    _rulerPickerController = RulerPickerController();
    _rulerPickerController!.value = userProvider.userInfoUpdate.height as num;
  }

  @override
  void dispose() {
    super.dispose();
    _rulerPickerController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Positioned(
                  bottom: 0,
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: userProvider.userInfoUpdate.height.toString(),
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                      ),
                      const TextSpan(
                        text: "Cm",
                      )
                    ])),
                  ),
                ),
                Transform.rotate(
                  angle: -3.14 / 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width -
                        AppStyles.paddingBothSides * 2,
                    height: MediaQuery.of(context).size.width -
                        AppStyles.paddingBothSides * 2,
                    child: RulerPicker(
                      marker: Column(
                        children: [
                          Container(
                            width: 2,
                            height: 100,
                            color: AppColors.primaryColor,
                          ),
                        ],
                      ),
                      onValueChanged: (value) {
                        userProvider.updateUser(height: value as double);
                      },
                      width: MediaQuery.of(context).size.width -
                          AppStyles.paddingBothSides * 2,
                      height: 80,
                      rulerBackgroundColor: Colors.transparent,
                      controller: _rulerPickerController,
                      onBuildRulerScaleText: (index, value) {
                        return value.toInt().toString();
                      },
                      ranges: ranges,
                      rulerMarginTop: 8,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    });
  }
}
