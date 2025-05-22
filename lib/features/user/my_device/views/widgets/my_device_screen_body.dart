import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/features/user/my_device/views/widgets/communication.dart';
import 'package:safe_steps/features/user/my_device/views/widgets/heart_beats.dart';
import 'package:safe_steps/features/user/my_device/views/widgets/location_geo_fencing.dart';
import 'package:safe_steps/features/user/my_device/views/widgets/send_alert.dart';

class MyDeviceScreenBody extends StatelessWidget {
  const MyDeviceScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.width * 0.03,
        vertical: SizeConfig.height * 0.01,
      ),
      child: SingleChildScrollView(
        child: Column(
          spacing: SizeConfig.height * 0.01,
          children: [
            LocationGeoFencing(),
            Communication(),
            HeartBeats(),
            SendAlert(),
          ],
        ),
      ),
    );
  }
}
