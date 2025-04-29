import 'package:flutter/material.dart';
import 'package:safe_steps/core/app_route/route_names.dart';
import 'package:safe_steps/core/utilies/assets/images/app_images.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/auth/sign%20up/views/widgets/have_account_or_not.dart';
import 'package:safe_steps/features/auth/sign%20up/views/widgets/sign_up_form.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.height * 0.3,
            child: Image.asset(AppImages.logoImage),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.width * 0.03,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        "Register",
                        style: AppTextStyles.title36WhiteW500.copyWith(color: AppColors.kThirdColor),
                      ),
                      Text(
                        "Create your account",
                        style: AppTextStyles.title18Black54,
                      ),
                      SizedBox(
                        height: SizeConfig.height * 0.08,
                      ),
                      SignUpForm(),
                      HaveAccountOrNot(
                        btnText: "Sign In",
                        route: RouteNames.signInScreen,
                        title: "Have an account?",
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
