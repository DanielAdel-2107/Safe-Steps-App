import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';

import 'package:flutter/material.dart';

class CustomOutLineButtonWithImage extends StatelessWidget {
  const CustomOutLineButtonWithImage({
    super.key,
    required this.name,
    this.onPressed,
    this.textStyle,
    this.hPadding,
    this.wPadding,
    this.height,
    this.width,
    required this.image,
  });
  final String name, image;
  final Function()? onPressed;
  final TextStyle? textStyle;
  final double? hPadding, wPadding;
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.05,
          vertical: SizeConfig.height * 0.008,
        ),
        side: BorderSide(color: AppColors.kThirdColor, width: 1.5),
        minimumSize: Size(
          width ?? double.infinity,
          height ?? SizeConfig.height * 0.07,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: hPadding ?? SizeConfig.width * 0.005,
              vertical: wPadding ?? SizeConfig.height * 0.007,
            ),
            height: SizeConfig.height * 0.05,
            width: SizeConfig.height * 0.05,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset(
              image,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            name,
            style: textStyle ??
                AppTextStyles.title22WhiteW500
                    .copyWith(color: AppColors.kThirdColor),
          ),
          Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
