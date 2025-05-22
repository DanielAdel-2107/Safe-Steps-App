import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/user/nurses/models/nurse_model.dart';
import 'package:safe_steps/features/user/nurses/views/widgets/nurse_list_view.dart';

class NursesScreenBody extends StatelessWidget {
  const NursesScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<NurseModel> nurses = [
      NurseModel(name: "Aya Mohamed", rating: 4),
      NurseModel(name: "Hana Ahmed", rating: 3.5),
      NurseModel(name: "Mahmoud Khaled", rating: 4.5),
    ];

    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.03,
            vertical: SizeConfig.height * 0.01,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.kThirdColor),
          ),
          child: Text(
            "300 / Day",
            style: AppTextStyles.title20ThirdColorW500,
          ),
        ),
        SizedBox(
          height: SizeConfig.height * 0.02,
        ),
        NursesListView(nurses: nurses),
      ],
    );
  }
}
