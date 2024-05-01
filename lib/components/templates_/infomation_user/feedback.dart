import 'package:carousel_slider/carousel_slider.dart';
import 'package:fit_ness/components/organisms/card_feedback.dart';
import 'package:fit_ness/themes/app_colors.dart';
import 'package:fit_ness/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_animate/flutter_animate.dart';

class UserFeedback extends StatefulWidget {
  const UserFeedback({super.key});

  @override
  State<UserFeedback> createState() => _UserFeedbackState();
}

class _UserFeedbackState extends State<UserFeedback> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    CarouselController carouselController = CarouselController();
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: AppStyles.paddingBothSides),
        child: Column(
          children: [
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Over ',
                  style: Theme.of(context).textTheme.displaySmall,
                  children: <TextSpan>[
                    const TextSpan(
                      text: '200,000',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
                    ),
                    TextSpan(
                      text: ' happy users are here!',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 32),
                    ),
                  ],
                )).animate().fadeIn(duration: 500.ms).slide(),
            const SizedBox(
              height: 20,
            ),
            CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height * 0.5,
                  aspectRatio: 16 / 9,
                  enlargeFactor: 0.1,
                  viewportFraction: 0.9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: List.generate(
                    listFeedback.length,
                    (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: CardFeedback(
                          feedbackItem: listFeedback[index],
                        )))),
            const SizedBox(
              height: 30,
            ),
            AnimatedSmoothIndicator(
                activeIndex: _current,
                count: listFeedback.length,
                effect: const ExpandingDotsEffect(
                    dotHeight: 5,
                    dotWidth: 7,
                    activeDotColor: AppColors.primaryColor),
                onDotClicked: (index) {})
          ],
        ),
      ),
    );
  }
}

final List<FeedbackItem> listFeedback = [
  FeedbackItem(
      image:
          "https://img.freepik.com/free-photo/active-healthy-asian-girl-with-fit-body-doing-fitness-exercises-home-lifting-dumbbells_1258-83725.jpg?t=st=1714535403~exp=1714539003~hmac=7b55f6ecb82eed0f3af6425356d519b145748d4f0ea2268c540780b8a3431afa&w=1060",
      description:
          "I never thought could regain the shape I had when I was young. This app changed that I've lost 20 pounds and gained muscle definition",
      name: "CaoNam",
      age: "25 year old"),
  FeedbackItem(
      image:
          "https://img.freepik.com/free-photo/active-healthy-asian-girl-with-fit-body-doing-fitness-exercises-home-lifting-dumbbells_1258-83725.jpg?t=st=1714535403~exp=1714539003~hmac=7b55f6ecb82eed0f3af6425356d519b145748d4f0ea2268c540780b8a3431afa&w=1060",
      description:
          "I never thought could regain the shape I had when I was young. This app changed that I've lost 20 pounds and gained muscle definition",
      name: "CaoNam",
      age: "25 year old"),
  FeedbackItem(
      image:
          "https://img.freepik.com/free-photo/active-healthy-asian-girl-with-fit-body-doing-fitness-exercises-home-lifting-dumbbells_1258-83725.jpg?t=st=1714535403~exp=1714539003~hmac=7b55f6ecb82eed0f3af6425356d519b145748d4f0ea2268c540780b8a3431afa&w=1060",
      description:
          "I never thought could regain the shape I had when I was young. This app changed that I've lost 20 pounds and gained muscle definition",
      name: "CaoNam",
      age: "25 year old"),
  FeedbackItem(
      image:
          "https://img.freepik.com/free-photo/active-healthy-asian-girl-with-fit-body-doing-fitness-exercises-home-lifting-dumbbells_1258-83725.jpg?t=st=1714535403~exp=1714539003~hmac=7b55f6ecb82eed0f3af6425356d519b145748d4f0ea2268c540780b8a3431afa&w=1060",
      description:
          "I never thought could regain the shape I had when I was young. This app changed that I've lost 20 pounds and gained muscle definition",
      name: "CaoNam",
      age: "25 year old"),
];

class FeedbackItem {
  final String image;
  final String description;
  final String name;
  final String age;

  FeedbackItem({
    required this.image,
    required this.description,
    required this.name,
    required this.age,
  });
}
