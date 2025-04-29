import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_steps/core/components/custom_gradiant_button.dart';
import 'package:safe_steps/core/utilies/assets/images/app_images.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/user/buy_watch/view_models/cubit/buy_watch_cubit.dart';

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

class BuyWatchScreenBody extends StatelessWidget {
  const BuyWatchScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BuyWatchCubit(),
      child: BlocConsumer<BuyWatchCubit, BuyWatchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = context.read<BuyWatchCubit>();
          return Column(
            children: [
              Image.asset(
                cubit.image,
                width: SizeConfig.width * 0.6,
                height: SizeConfig.height * 0.45,
                fit: BoxFit.fill,
              ),
              Expanded(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Colors",
                            style: AppTextStyles.title18BlackW400,
                          ),
                          SizedBox(
                            width: SizeConfig.width * 0.5,
                            height: SizeConfig.height * 0.05,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CustomColor(
                                    onTap: () {
                                      cubit.changeWatchColor(index);
                                    },
                                    color: cubit.colors[index],
                                  );
                                },
                                separatorBuilder: (context, index) => SizedBox(
                                      width: SizeConfig.width * 0.01,
                                    ),
                                itemCount: cubit.colors.length),
                          )
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.height * 0.05,
                      ),
                      CustomGradiantButtonWithIcon(
                        title: "Buy Now!",
                        onPressed: () {},
                        height: SizeConfig.height * 0.07,
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class CustomColor extends StatelessWidget {
  const CustomColor({
    super.key,
    required this.color, this.onTap,
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
