
import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/user/buy_watch/views/widgets/watch_colors_list_view.dart';

class WatchColor extends StatelessWidget {
  const WatchColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Colors",
          style: AppTextStyles.title18BlackW400,
        ),
        SizedBox(
          width: SizeConfig.width * 0.5,
          height: SizeConfig.height * 0.05,
          child: WatchColorsListView(),
        )
      ],
    );
  }
}
