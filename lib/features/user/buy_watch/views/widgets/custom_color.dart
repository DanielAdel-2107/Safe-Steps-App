import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';

class CustomColor extends StatelessWidget {
  const CustomColor({
    super.key,
    required this.color,
    this.onTap,
  });
  final Color color;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.width * 0.1,
        height: SizeConfig.height * 0.05,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: SizeConfig.width * 0.003,
          ),
        ),
      ),
    );
  }
}
