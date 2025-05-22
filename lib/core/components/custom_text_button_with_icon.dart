import 'package:safe_steps/core/utilies/colors/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';



class CustomTextButtonWithIcon extends StatelessWidget {
  const CustomTextButtonWithIcon({
    super.key,
    this.onPressed,
    required this.title,
    this.style, this.icon,
  });
  final Function()? onPressed;
  final String title;
  final TextStyle? style;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(
        title,
        style: style ?? AppTextStyles.title18PrimaryColorW500,
      ),
      icon: Icon(icon,color: AppColors.kPrimaryColor,size: SizeConfig.width * 0.05,),
      iconAlignment: IconAlignment.end,
    );
  }
}
