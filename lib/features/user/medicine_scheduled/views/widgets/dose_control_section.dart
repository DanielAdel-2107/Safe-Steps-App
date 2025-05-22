import 'package:flutter/material.dart';
import 'package:safe_steps/core/components/custom_icon_button.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';

class DoseControlSection extends StatelessWidget {
  final String label;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final int value;
  const DoseControlSection({
    super.key,
    required this.label,
    required this.onIncrement,
    required this.onDecrement,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: AppTextStyles.title18ThirdColorW500),
        Row(
          children: [
            CustomIconButton(
              iconColor: AppColors.kThirdColor,
              icon: Icons.remove_circle_outline,
              onPressed: onDecrement,
            ),
            Text(value.toString(), style: AppTextStyles.title18ThirdColorW500),
            CustomIconButton(
              iconColor: AppColors.kThirdColor,
              icon: Icons.add_circle_outline_sharp,
              onPressed: onIncrement,
            ),
          ],
        ),
      ],
    );
  }
}
