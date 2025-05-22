import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_steps/core/components/custom_icon_button.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/features/user/profile/view_models/cubit/edit_profile_cubit.dart';

class PickImage extends StatelessWidget {
  const PickImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return Stack(
          children: [
            CircleAvatar(
              radius: SizeConfig.width * 0.2,
              backgroundImage: context.read<EditProfileCubit>().imageUrl != null
                  ? NetworkImage(context.read<EditProfileCubit>().imageUrl!)
                  : context.read<EditProfileCubit>().imageFile == null
                      ? null
                      : FileImage(
                          context.read<EditProfileCubit>().imageFile!,
                        ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: AppColors.kThirdColor,
                child: CustomIconButton(
                  icon: Icons.upload,
                  onPressed: () {
                    context.read<EditProfileCubit>().pickImage();
                  },
                  iconSize: SizeConfig.width * 0.06,
                  iconColor: Colors.white,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
