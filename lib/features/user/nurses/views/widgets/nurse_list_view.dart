import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/features/user/nurses/models/nurse_model.dart';
import 'package:safe_steps/features/user/nurses/views/widgets/custom_nurse_card.dart';

class NursesListView extends StatelessWidget {
  const NursesListView({
    super.key,
    required this.nurses,
  });

  final List<NurseModel> nurses;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.width * 0.03),
        itemCount: nurses.length,
        itemBuilder: (context, index) {
          return CustomNurseCard(nurse: nurses[index]);
        },
      ),
    );
  }
}
