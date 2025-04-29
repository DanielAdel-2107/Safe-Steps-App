import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_steps/core/app_route/route_names.dart';
import 'package:safe_steps/core/components/custom_gradiant_button.dart';
import 'package:safe_steps/core/components/custom_text_button.dart';
import 'package:safe_steps/core/components/custom_text_form_field_with_title.dart';
import 'package:safe_steps/core/helper/show_clipper_dialog.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/extensions/app_extensions.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/features/auth/sign%20in/view_models/cubit/sign_in_cubit.dart';
import 'package:safe_steps/features/auth/sign%20up/views/widgets/custom_loading.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            context.pushReplacementScreen(RouteNames.userHomeScreen);
            showCustomClipperDialog(
              title: "Success",
              message: "Sign In Successfully",
            );
          }
          if (state is SignInFailure) {
            showCustomClipperDialog(
              title: "Failure",
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<SignInCubit>();
          return Form(
            key: cubit.formKey,
            child: Column(
              children: [
                CustomTextFormFieldWithTitle(
                  hintText: "enter your email",
                  title: "Email",
                  controller: cubit.emailController,
                ),
                SizedBox(
                  height: SizeConfig.height * 0.006,
                ),
                CustomTextFormFieldWithTitle(
                  hintText: "enter your password",
                  title: "Password",
                  isPassword: true,
                  controller: cubit.passwordController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      title: "Forget Password?",
                      alignment: Alignment.topRight,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.height * 0.03,
                ),
                state is SignInLoading
                    ? CustomLoading()
                    : CustomGradiantButtonWithIcon(
                        title: "Sign In",
                        colors: [
                          Colors.grey.shade500,
                          AppColors.kForthColor,
                          AppColors.kForthColor
                        ],
                        onPressed: () => cubit.signIn(),
                        height: SizeConfig.height * 0.07,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
