import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_steps/core/helper/show_clipper_dialog.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/extensions/app_extensions.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/user/medicine_scheduled/view_models/cubit/add_medicine_plan_cubit.dart';
import 'package:safe_steps/features/user/medicine_scheduled/views/widgets/add_medicine_button.dart';
import 'package:safe_steps/features/user/medicine_scheduled/views/widgets/medicine_item.dart';

class MedicineScheduledScreenBody extends StatelessWidget {
  const MedicineScheduledScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicinePlanCubit(),
      child: BlocConsumer<MedicinePlanCubit, MedicinePlanState>(
        listener: (context, state) {
          if (state is AddMedicinePlanSuccess ||
              state is AddMedicinePlanFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                Navigator.of(context, rootNavigator: true).pop();
                showCustomClipperDialog(
                  title: state is AddMedicinePlanSuccess ? "Success" : "Error",
                  message: state is AddMedicinePlanSuccess
                      ? "Medicine plan added successfully"
                      : (state as AddMedicinePlanFailure).message,
                );
              }
            });
          }
        },
        builder: (context, state) {
          final cubit = context.read<MedicinePlanCubit>();

          if (state is GetMedicinePlanLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetMedicinePlanFailure) {
            return Center(
              child: Text(
                state.message,
                style: AppTextStyles.title24PrimaryColorBold
                    .copyWith(color: AppColors.kThirdColor),
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.03,
              vertical: SizeConfig.height * 0.01,
            ),
            child:ListView.builder(
                    itemCount: cubit.myMedicinePlanList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < cubit.myMedicinePlanList.length) {
                        return MedicineItem(
                            medicine: cubit.myMedicinePlanList[index]);
                      }
                      return const AddMedicineButton();
                    },
                  ),
          );
        },
      ),
    );
  }
}
