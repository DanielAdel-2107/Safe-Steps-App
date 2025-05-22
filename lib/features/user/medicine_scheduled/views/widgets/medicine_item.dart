import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/user/medicine_scheduled/models/medicine_plan_model.dart';

class MedicineItem extends StatelessWidget {
  final MedicinePlanModel medicine;

  const MedicineItem({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.height * 0.02),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width * 0.03,
        vertical: SizeConfig.height * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.kThirdColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text("Name", style: AppTextStyles.title20ThirdColorW500),
              Text(medicine.medicineName,
                  style: AppTextStyles.title18BlackW400),
            ],
          ),
          Column(
            children: [
              Text("Dose", style: AppTextStyles.title20ThirdColorW500),
              Text("${medicine.time} Times / ${medicine.perDay} days",
                  style: AppTextStyles.title18BlackW400),
            ],
          ),
        ],
      ),
    );
  }
}
