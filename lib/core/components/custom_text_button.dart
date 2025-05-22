import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';



class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.title,
    this.style, this.alignment,  this.backgroundColor,
  });
  final Function()? onPressed;
  final String title;
  final TextStyle? style;
  final AlignmentGeometry? alignment;
  final Color ?backgroundColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        alignment:alignment?? Alignment.topCenter,
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: style ?? AppTextStyles.title18WhiteW500.copyWith(color: AppColors.kThirdColor),
      ),
    );
  }
}
