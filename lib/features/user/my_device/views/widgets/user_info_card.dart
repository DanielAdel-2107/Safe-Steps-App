import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';

class UserDetailsCard extends StatelessWidget {
  const UserDetailsCard({
    super.key,
    required this.title,
    this.icon,
    required this.child,
  });
  final String title;
  final IconData? icon;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: AppColors.kThirdColor, width: 1.5),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.03,
              vertical: SizeConfig.height * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: AppColors.kThirdColor,
                ),
                SizedBox(
                  width: SizeConfig.width * 0.02,
                ),
                Text(
                  title,
                  style: AppTextStyles.title20ThirdColorW500,
                )
              ],
            ),
          ),
          Divider(
            color: AppColors.kThirdColor,
            thickness: 1.5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.03,
              vertical: SizeConfig.height * 0.01,
            ),
            child: child,
          )
        ],
      ),
    );
  }
}
