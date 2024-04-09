import 'package:fit_ness/components/atoms/button.dart';
import 'package:flutter/material.dart';

class WorkoutPause extends StatelessWidget {
  const WorkoutPause({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0), // Màu trong suốt ở đầu
            Colors.white, // Màu trắng ở cuối
          ],
        ),
      ),
      child: Column(
        children: [
          Text("Hold on !"),
          Text("You can do it !"),
          Text("You hava finished 0%"),
          Text("Only 15 exercises left"),
          Button(size: SizeButton.medium, title: "Resume"),
          Button(size: SizeButton.medium, title: "Restart this exercies"),
          Text("Quit")
        ],
      ),
    );
  }
}
