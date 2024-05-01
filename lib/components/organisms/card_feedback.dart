import 'package:fit_ness/components/templates_/infomation_user/feedback.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CardFeedback extends StatelessWidget {
  final FeedbackItem feedbackItem;
  const CardFeedback({
    super.key,
    required this.feedbackItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppStyles.borderRadiusCard),
          color: Colors.grey.withOpacity(0.1),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ]),
      child: Column(
        children: [
          Image.network(
            feedbackItem.image,
            height: MediaQuery.of(context).size.height * 0.26,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.23,
            child: Padding(
              padding: const EdgeInsets.all(AppStyles.paddingCard),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                        5,
                        (index) => const Icon(
                              size: 19,
                              FluentIcons.star_12_filled,
                              color: Colors.yellowAccent,
                            )),
                  ),
                  Text(
                    feedbackItem.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "@${feedbackItem.name}, ${feedbackItem.age}",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w400, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
