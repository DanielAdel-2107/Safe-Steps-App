import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';

import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';


class CustomGradiantButtonWithIcon extends StatelessWidget {
  const CustomGradiantButtonWithIcon({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
    this.textStyle,
    this.height,
    this.width, this.colors,
  });
  final String title;
  final Function()? onPressed;
  final TextStyle? textStyle;
  final IconData? icon;
  final double? height, width;
  final List<Color> ?colors ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors:colors?? [AppColors.kPrimaryColor, AppColors.kSecondryColor],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        height: height,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: textStyle ?? AppTextStyles.title20WhiteW500,
            ),
            SizedBox(
              width: SizeConfig.width * 0.02,
            ),
            icon == null
                ? SizedBox()
                : Icon(
                    icon,
                    color: Colors.white,
                  )
          ],
        ),
      ),
    );
    // ElevatedButton.icon(
    //   style: ElevatedButton.styleFrom(
    //     backgroundColor: backgroundColor,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    //     padding: EdgeInsets.symmetric(
    //         horizontal: SizeConfig.width * 0.06,
    //         vertical: SizeConfig.height * 0.01),
    //     minimumSize: (height != null && width != null)
    //         ? Size(width!, height!)
    //         : Size(SizeConfig.width * 0.7, SizeConfig.height * 0.07),
    //   ),
    //   iconAlignment: iconAlignment ?? IconAlignment.end,
    //   onPressed: onPressed,
    //   icon: image != null
    //       ? Image.asset(
    //           image!,
    //           width: SizeConfig.width * 0.1,
    //         )
    //       : Icon(
    //           icon,
    //           color: Colors.white,
    //         ),
    //   label: Text(
    //     title,
    //     style: textStyle ?? AppTextStyles.title18WhiteW500,
    //   ),
    // );
  }
}
