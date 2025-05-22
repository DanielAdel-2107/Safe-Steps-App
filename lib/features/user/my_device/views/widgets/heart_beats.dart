import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/user/my_device/views/widgets/user_info_card.dart';

class HeartBeats extends StatelessWidget {
  const HeartBeats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UserDetailsCard(
      icon: Icons.group,
      title: "Heart Beats",
      child: Center(
        child: Text(
          ".................",
          style: AppTextStyles.title18ThirdColorW500,
        ),
      ),
    );
  }
}
