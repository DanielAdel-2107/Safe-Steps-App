import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  CircularProgressIndicator(
        color: AppColors.kThirdColor,
      ),
    );
  }
}
