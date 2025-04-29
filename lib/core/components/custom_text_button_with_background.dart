import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';


class CustomTextButtonWithBackground extends StatelessWidget {
  const CustomTextButtonWithBackground({
    super.key,
    this.onTap,
    required this.btnText,
  });
  final Function()? onTap;
  final String btnText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.02,
          vertical: SizeConfig.height * 0.002,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade500.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          btnText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.title14White,
        ),
      ),
    );
  }
}
