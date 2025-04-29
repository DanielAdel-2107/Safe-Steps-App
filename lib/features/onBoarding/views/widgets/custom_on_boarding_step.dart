import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';

class CustomOnBoardingStep extends StatelessWidget {
  const CustomOnBoardingStep({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });
  final String title;
  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width * 0.03,
        vertical: SizeConfig.height * 0.03,
      ),
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.height * 0.05,
          ),
          Text(
            title,
            style: AppTextStyles.title28PrimaryColorW500.copyWith(color: AppColors.kThirdColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: SizeConfig.height * 0.05,
          ),
          Text(
            description,
            style: AppTextStyles.title18Black54,
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Lottie.asset(image),
          ),
        ],
      ),
    );
  }
}
