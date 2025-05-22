import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_steps/core/components/custom_gradiant_button.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/user/buy_watch/view_models/cubit/buy_watch_cubit.dart';
import 'package:safe_steps/features/user/buy_watch/views/widgets/watch_color.dart';

class WatchDetails extends StatelessWidget {
  const WatchDetails({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.05,
          vertical: SizeConfig.height * 0.04,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeConfig.height * 0.05),
            topRight: Radius.circular(SizeConfig.height * 0.05),
          ),
          border: Border.all(
            color: AppColors.kThirdColor,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Safe-Steps Watch",
                  style: AppTextStyles.title20BlacKBold,
                ),
                Text(
                  "10,000 EGP",
                  style: AppTextStyles.title20BlacKBold,
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.height * 0.02,
            ),
            Text(
              "Stay connected and worry-free with Safe Steps — real-time tracking, instant alerts, and two-way communication for ultimate peace of mind.",
              style: AppTextStyles.title16Black,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: SizeConfig.height * 0.02,
            ),
            WatchColor(),
            SizedBox(
              height: SizeConfig.height * 0.05,
            ),
            BlocBuilder<BuyWatchCubit, BuyWatchState>(
              builder: (context, state) {
                return state is BuyWatchLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.kThirdColor,
                        ),
                      )
                    : CustomGradiantButtonWithIcon(
                        title: "Buy Now!",
                        onPressed: () {
                          context.read<BuyWatchCubit>().buyWatch();
                        },
                        height: SizeConfig.height * 0.07,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
