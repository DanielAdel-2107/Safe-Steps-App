import 'package:flutter/material.dart';
import 'package:safe_steps/features/user/medicine_scheduled/views/widgets/custom_app_bar.dart';
import 'package:safe_steps/features/user/medicine_scheduled/views/widgets/medicine_scheduled_screen_body.dart';

class MedicineScheduledScreen extends StatelessWidget {
  const MedicineScheduledScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Medicine Scheduled",
      ),
      body: MedicineScheduledScreenBody(),
    );
  }
}
