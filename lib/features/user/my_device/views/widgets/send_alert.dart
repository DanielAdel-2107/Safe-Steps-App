import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/user/my_device/views/widgets/user_info_card.dart';

class SendAlert extends StatelessWidget {
  const SendAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UserDetailsCard(
      icon: Icons.notifications,
      title: "Send Alert",
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.notifications_active_outlined,
                  color: AppColors.kThirdColor,
                  size: SizeConfig.width * 0.08,
                ),
                SizedBox(
                  width: SizeConfig.width * 0.1,
                ),
                Text(
                  "Alert 1",
                  style: AppTextStyles.title18ThirdColorW500,
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.notifications_active_outlined,
                  color: AppColors.kThirdColor,
                  size: SizeConfig.width * 0.08,
                ),
                SizedBox(
                  width: SizeConfig.width * 0.1,
                ),
                Text(
                  "Alert 2",
                  style: AppTextStyles.title18ThirdColorW500,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
