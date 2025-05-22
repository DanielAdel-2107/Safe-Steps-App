import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/features/user/buy_watch/views/widgets/buy_watch_screen_body.dart';

class BuyWatchScreen extends StatelessWidget {
  const BuyWatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.kThirdColor,
      ),
      body: BuyWatchScreenBody(),
    );
  }
}




