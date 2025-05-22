import 'package:flutter/material.dart';
import 'package:safe_steps/features/user/medicine_scheduled/views/widgets/custom_app_bar.dart';
import 'package:safe_steps/features/user/nurses/views/widgets/nurses_screen_body.dart';

class NursesScreen extends StatelessWidget {
  const NursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Nurses"),
      body: NursesScreenBody(),
    );
  }
}



