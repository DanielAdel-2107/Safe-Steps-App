import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_steps/core/components/custom_gradiant_button.dart';
import 'package:safe_steps/core/components/custom_text_form_field_with_title.dart';
import 'package:safe_steps/core/helper/show_clipper_dialog.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/extensions/app_extensions.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/features/auth/sign%20up/view_models/cubit/sign_up_cubit.dart';
import 'package:safe_steps/features/auth/sign%20up/views/widgets/custom_loading.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            context.popScreen();
            showCustomClipperDialog(
              title: "Success",
              message: "Create Account Successfully",
            );
          }
          if (state is SignUpFailure) {
            showCustomClipperDialog(
              title: "Failure",
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<SignUpCubit>();
          return Form(
            key: cubit.formKey,
            child: Column(
              children: [
                CustomTextFormFieldWithTitle(
                  hintText: "enter your name",
                  title: "Full Name",
                  controller: cubit.nameController,
                ),
                SizedBox(
                  height: SizeConfig.height * 0.006,
                ),
                CustomTextFormFieldWithTitle(
                  hintText: "enter your email",
                  title: "Email",
                  controller: cubit.emailController,
                ),
                SizedBox(
                  height: SizeConfig.height * 0.006,
                ),
                CustomTextFormFieldWithTitle(
                  hintText: "enter your phone number",
                  title: "Phone Number",
                  controller: cubit.phoneNumberController,
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
                SizedBox(
                  height: SizeConfig.height * 0.03,
                ),
                state is SignUpLoading
                    ? CustomLoading()
                    : CustomGradiantButtonWithIcon(
                        title: "Sign Up",
                        colors: [
                          Colors.grey.shade500,
                          AppColors.kForthColor,
                          AppColors.kForthColor
                        ],
                        height: SizeConfig.height * 0.07,
                        onPressed: () => cubit.signUp(),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
