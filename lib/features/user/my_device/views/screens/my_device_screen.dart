import 'package:flutter/material.dart';
import 'package:safe_steps/features/user/medicine_scheduled/views/widgets/custom_app_bar.dart';
import 'package:safe_steps/features/user/my_device/views/widgets/my_device_screen_body.dart';

class MyDeviceScreen extends StatelessWidget {
  const MyDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Medicine Scheduled",
      ),
      body: MyDeviceScreenBody(),
    );
  }
}
