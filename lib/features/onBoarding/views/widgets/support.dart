import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/assets/lotties/app_lotties.dart';
import 'package:safe_steps/features/onBoarding/views/widgets/custom_on_boarding_step.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingStep(
        title: "Support, When You Need It",
        description:
            "YoFind nearby drivers and professional nurses with a tap. Your profile stores everything you need for a quick and easy service.",
        image: AppLotties.supportLottie);
  }
}

