import 'package:flutter/material.dart';
import 'package:safe_steps/core/components/custom_text_button.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/extensions/app_extensions.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';

class HaveAccountOrNot extends StatelessWidget {
  const HaveAccountOrNot({
    super.key,
    required this.route,
    required this.title,
    required this.btnText,
  });
  final String route;
  final String title;
  final String btnText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.title18White.copyWith(color: AppColors.kThirdColor),
        ),
        CustomTextButton(
          title: btnText,
          onPressed: () => context.pushScreen(route),
        )
      ],
    );
  }
}
