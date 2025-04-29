import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/assets/lotties/app_lotties.dart';
import 'package:safe_steps/features/onBoarding/views/widgets/custom_on_boarding_step.dart';

class TrackWithReminders extends StatelessWidget {
  const TrackWithReminders({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOnBoardingStep(
        title: "Stay on Track with Reminders",
        description:
            "Get notified for your medications, monitor your heart rate, and never miss a beat — your health assistant is always on your wrist.",
        image: AppLotties.notificationsLottie);
  }
}
