import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/user/medicine_scheduled/view_models/cubit/add_medicine_plan_cubit.dart';
import 'package:safe_steps/features/user/medicine_scheduled/views/widgets/dose_control_section.dart';

class DoseSection extends StatelessWidget {
  const DoseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicinePlanCubit, MedicinePlanState>(
      builder: (context, state) {
        return Column(
          children: [
            Text("Medicine Dose", style: AppTextStyles.title18ThirdColorW500),
            SizedBox(height: SizeConfig.height * 0.005),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DoseControlSection(
                  label: "How many times?",
                  value: context.read<MedicinePlanCubit>().time,
                  onIncrement: () =>
                      context.read<MedicinePlanCubit>().increaseTime(),
                  onDecrement: () =>
                      context.read<MedicinePlanCubit>().decreaseTime(),
                ),
                DoseControlSection(
                  label: "per day",
                  value: context.read<MedicinePlanCubit>().perDay,
                  onIncrement: () =>
                      context.read<MedicinePlanCubit>().increasePerDay(),
                  onDecrement: () =>
                      context.read<MedicinePlanCubit>().decreasePerDay(),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
