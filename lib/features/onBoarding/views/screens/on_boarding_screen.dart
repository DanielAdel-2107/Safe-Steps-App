import 'package:flutter/material.dart';
import 'package:safe_steps/features/onBoarding/views/widgets/on_boarding_screen_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingScreenBody(),
    );
  }
}

