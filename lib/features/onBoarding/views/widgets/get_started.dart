import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/assets/lotties/app_lotties.dart';
import 'package:safe_steps/features/onBoarding/views/widgets/custom_on_boarding_step.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingStep(
        title: "Ready to Take Control",
        description:
            "YouOrder your HealthEase Smart Watch now and kickstart your wellness journey. Set up your profile, enjoy personalized features, and let HealthEase support your health — one tap at a time.",
        image: AppLotties.orderNowLottie);
  }
}
