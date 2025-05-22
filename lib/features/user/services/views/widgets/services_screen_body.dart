import 'package:flutter/material.dart';
import 'package:safe_steps/core/app_route/route_names.dart';
import 'package:safe_steps/core/components/custom_out_line_button_with_image.dart';
import 'package:safe_steps/core/utilies/assets/images/app_images.dart';
import 'package:safe_steps/core/utilies/extensions/app_extensions.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/features/user/profile/views/widgets/triple_bottom_wave_painter.dart';

class ServicesScreenBody extends StatelessWidget {
  const ServicesScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.height * 0.25,
          width: double.infinity,
          child: CustomPaint(
            painter: TripleBottomWavePainter(),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width * 0.05,
            vertical: SizeConfig.height * 0.02,
          ),
          child: Column(
            spacing: SizeConfig.height * 0.02,
            children: [
              CustomOutLineButtonWithImage(
                name: "My Device",
                image: AppImages.myDeviceImage,
                onPressed: () {
                  context.pushScreen(RouteNames.myDeviceScreen);
                },
              ),
              CustomOutLineButtonWithImage(
                name: "Medical Scheduled",
                image: AppImages.medicalImage,
                onPressed: () {
                  context.pushScreen(RouteNames.medicineScheduledScreen);
                },
              ),
              CustomOutLineButtonWithImage(
                name: "Nurses",
                image: AppImages.nurseImage,
                onPressed: () {
                  context.pushScreen(RouteNames.nursesScreen);
                },
              ),
              CustomOutLineButtonWithImage(
                name: "Transportation",
                image: AppImages.transportationImage,
                onPressed: () {
                  context.pushScreen(RouteNames.transportationScreen);
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
