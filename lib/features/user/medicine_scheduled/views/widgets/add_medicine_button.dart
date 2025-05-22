import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/user/medicine_scheduled/view_models/cubit/add_medicine_plan_cubit.dart';
import 'package:safe_steps/features/user/medicine_scheduled/views/widgets/add_medicine_bottom_sheet.dart';

class AddMedicineButton extends StatelessWidget {
  const AddMedicineButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width * 0.03,
        vertical: SizeConfig.height * 0.02,
      ),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            enableDrag: true,
            builder: (_) => BlocProvider.value(
              value: context.read<MedicinePlanCubit>(),
              child: AddMedicineBottomSheet(),
            ),
          );
        },
        child: Row(
          children: [
            Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.kThirdColor,
              size: SizeConfig.width * 0.08,
            ),
            SizedBox(width: SizeConfig.width * 0.03),
            Text("Add Medicine", style: AppTextStyles.title20ThirdColorW500),
          ],
        ),
      ),
    );
  }
}
