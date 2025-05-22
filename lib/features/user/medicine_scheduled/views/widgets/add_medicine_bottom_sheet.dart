import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_steps/core/components/custom_elevated_button.dart';
import 'package:safe_steps/core/components/custom_text_form_field_with_title.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/user/medicine_scheduled/view_models/cubit/add_medicine_plan_cubit.dart';
import 'package:safe_steps/features/user/medicine_scheduled/views/widgets/dose_section.dart';

class AddMedicineBottomSheet extends StatelessWidget {
  const AddMedicineBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.height * 0.02,
        left: SizeConfig.width * 0.03,
        right: SizeConfig.width * 0.03,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20, // لتفادي لوحة المفاتيح
      ),
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Form(
          key: context.read<MedicinePlanCubit>().formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Add Medicine Plan",
                  style: AppTextStyles.title24PrimaryColorW500.copyWith(
                    color: AppColors.kThirdColor,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.height * 0.03),
              CustomTextFormFieldWithTitle(
                hintText: "",
                title: "Medicine Name",
                controller: context.read<MedicinePlanCubit>().medicineNameController,
              ),
              SizedBox(height: SizeConfig.height * 0.015),
              Divider(),
              SizedBox(height: SizeConfig.height * 0.015),
              DoseSection(),
              SizedBox(height: SizeConfig.height * 0.03),
              BlocBuilder<MedicinePlanCubit, MedicinePlanState>(
                builder: (context, state) {
                  return state is AddMedicinePlanLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.kThirdColor,
                          ),
                        )
                      : CustomElevatedButton(
                          name: "Add",
                          onPressed: () async {
                            await context.read<MedicinePlanCubit>().addMedicinePlan();
                          },
                          backgroundColor: AppColors.kThirdColor,
                          textStyle: AppTextStyles.title20WhiteBold,
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
