import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:safe_steps/core/utilies/assets/images/app_images.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width * 0.1,
      ),
      child: Center(
        child: Image.asset(AppImages.logoImage)
            .animate()
            .moveY(begin: -100, end: 0, duration: 1500.ms)
            .fadeIn(delay: 1200.ms, duration: 1000.ms),
      ),
    );
  }
}
