import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_steps/core/helper/show_clipper_dialog.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/features/user/profile/view_models/cubit/edit_profile_cubit.dart';
import 'package:safe_steps/features/user/profile/views/widgets/triple_bottom_wave_painter.dart';
import 'package:safe_steps/features/user/profile/views/widgets/user_details.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileCubit(),
      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileSuccess) {
            showCustomClipperDialog(
              title: "Success",
              message: "Profile Updated Successfully",
            );
          }
          if (state is EditProfileFailure) {
            showCustomClipperDialog(
              title: "Failure",
              message: state.errorMessage,
            );
          }
          if (state is NoChangesMade) {
            showCustomClipperDialog(
              title: "Hint",
              message: "No changes were made",
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<EditProfileCubit>();
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.height * 0.25,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: TripleBottomWavePainter(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.width * 0.03,
                    vertical: SizeConfig.height * 0.03,
                  ),
                  child: SingleChildScrollView(
                    child: UserDetails(cubit: cubit),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
