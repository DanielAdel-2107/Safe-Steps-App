import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';


class CustomTextFormFieldWithoutBorder extends StatelessWidget {
  const CustomTextFormFieldWithoutBorder({
    super.key,
    required this.hintText,
    this.controller,
  });
  final String hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: SizeConfig.height * 0.01,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none),
        hintText: hintText,
        hintStyle: AppTextStyles.title22WhiteW500,
      ),
      style: AppTextStyles.title16White500,
    );
  }
}
