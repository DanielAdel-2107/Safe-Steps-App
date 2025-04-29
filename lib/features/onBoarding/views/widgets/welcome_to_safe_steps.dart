import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/assets/lotties/app_lotties.dart';
import 'package:safe_steps/features/onBoarding/views/widgets/custom_on_boarding_step.dart';

class WelcomeToSafeSteps extends StatelessWidget {
  const WelcomeToSafeSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingStep(
        title: "Welcome to Safe Steps",
        description:
            "Your all-in-one smart health companion. Discover a new way to manage your well-being, stay organized, and get support when you need it.",
        image: AppLotties.welcomeLottie);
  }
}
