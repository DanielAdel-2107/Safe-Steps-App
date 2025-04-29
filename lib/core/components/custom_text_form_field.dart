import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.maxline = 1,
      this.fillColor,
      this.onChanged});
  final int maxline;
  final String hintText;
  final TextEditingController? controller;
  final IconData? prefixIcon, suffixIcon;
  final Color? fillColor;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon,color: AppColors.kForthColor,),
            suffixIcon: Icon(suffixIcon),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color:AppColors.kForthColor,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: SizeConfig.height * 0.017,
            ),
            filled: true,
            fillColor: fillColor ?? Colors.white,
          ),
          maxLines: maxline,
        )
      ],
    );
  }
}
