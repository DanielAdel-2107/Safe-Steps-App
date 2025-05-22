import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/assets/lotties/app_lotties.dart';
import 'package:safe_steps/features/onBoarding/views/widgets/custom_on_boarding_step.dart';

class SmartHealth extends StatelessWidget {
  const SmartHealth({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingStep(
        title: "Smart Health, Made Easy",
        description:
            "Buy your smart watch and set it up in minutes. Track your health, stay connected, and manage your profile all in one place.",
        image: AppLotties.smartWatchLottie);
  }
}
