import 'package:flutter/material.dart';
import 'package:safe_steps/core/components/custom_gradiant_button.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/user/nurses/models/nurse_model.dart';

class CustomNurseCard extends StatelessWidget {
  const CustomNurseCard({
    super.key,
    required this.nurse,
  });

  final NurseModel nurse;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width * 0.03,
        vertical: SizeConfig.height * 0.01,
      ),
      margin: EdgeInsets.only(bottom: SizeConfig.height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.kThirdColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Name : ",
                style: AppTextStyles.title20Black87W500,
              ),
              Text(
                nurse.name,
                style: AppTextStyles.title20ThirdColorW500,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Rating : ",
                    style: AppTextStyles.title20Black87W500,
                  ),
                  Text(
                    "${nurse.rating} ",
                    style: AppTextStyles.title20ThirdColorW500,
                  ),
                  Icon(Icons.star, color: Colors.amber),
                ],
              ),
              CustomGradiantButtonWithIcon(
                title: "request",
                onPressed: () {},
                height: SizeConfig.height * 0.035,
                width: SizeConfig.width * 0.3,
              )
            ],
          ),
        ],
      ),
    );
  }
}
