import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/features/user/my_device/views/widgets/user_info_card.dart';

class Communication extends StatelessWidget {
  const Communication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UserDetailsCard(
      icon: Icons.group,
      title: "Communication",
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.call,
            color: AppColors.kThirdColor,
            size: SizeConfig.width * 0.08,
          ),
          SizedBox(
            width: SizeConfig.width * 0.1,
          ),
          Icon(
            Icons.call_end_rounded,
            color: AppColors.kThirdColor,
            size: SizeConfig.width * 0.08,
          ),
        ],
      ),
    );
  }
}
