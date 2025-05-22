import 'package:flutter/material.dart';
import 'package:safe_steps/core/components/custom_elevated_button.dart';
import 'package:safe_steps/core/components/custom_text_form_field_with_title.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/user/profile/view_models/cubit/edit_profile_cubit.dart';
import 'package:safe_steps/features/user/profile/views/widgets/pick_image.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.cubit,
  });

  final EditProfileCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PickImage(),
        SizedBox(
          height: SizeConfig.height * 0.05,
        ),
        CustomTextFormFieldWithTitle(
          title: "User Name",
          controller: cubit.nameController,
          hintText: cubit.nameController.text,
        ),
        SizedBox(
          height: SizeConfig.height * 0.01,
        ),
        CustomTextFormFieldWithTitle(
          title: "User Email",
          controller: cubit.emailController,
          hintText: cubit.emailController.text,
        ),
        SizedBox(
          height: SizeConfig.height * 0.1,
        ),
        CustomElevatedButton(
          name: "Edit",
          backgroundColor: AppColors.kThirdColor,
          textStyle: AppTextStyles.title20WhiteBold,
          onPressed: () {
            cubit.updateProfiele();
          },
        ),
      ],
    );
  }
}
