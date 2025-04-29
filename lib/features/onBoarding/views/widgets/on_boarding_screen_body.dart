import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_steps/core/app_route/route_names.dart';
import 'package:safe_steps/core/components/custom_gradiant_button.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/extensions/app_extensions.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/features/onBoarding/view_models/cubit/on_boarding_cubit.dart';
import 'package:safe_steps/features/onBoarding/view_models/cubit/on_boarding_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width * 0.1,
          vertical: SizeConfig.height * 0.01,
        ),
        child: BlocProvider(
          create: (context) => OnBoardingCubit(),
          child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
            builder: (context, state) {
              var cubit = context.read<OnBoardingCubit>();
              return Column(
                children: [
                  SmoothPageIndicator(
                    controller: cubit.pageIndectorController,
                    count: cubit.onBoardingSteps.length,
                    effect: SlideEffect(
                      dotWidth: SizeConfig.width * 0.15,
                      activeDotColor: AppColors.kThirdColor,
                      dotColor: Colors.grey.shade300,
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: cubit.pageIndectorController,
                      itemBuilder: (context, index) {
                        return cubit.onBoardingSteps[index];
                      },
                      onPageChanged: (index) => cubit.pageChanged(index),
                      itemCount: cubit.onBoardingSteps.length,
                    ),
                  ),
                  CustomGradiantButtonWithIcon(
                    title: cubit.initialPage >= cubit.onBoardingSteps.length - 1
                        ? "Get Started"
                        : "Continue",
                    height: SizeConfig.height * 0.07,
                    onPressed: () {
                      cubit.initialPage < cubit.onBoardingSteps.length - 1
                          ? cubit.nextPage()
                          : context
                              .pushReplacementScreen(RouteNames.signInScreen);
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
