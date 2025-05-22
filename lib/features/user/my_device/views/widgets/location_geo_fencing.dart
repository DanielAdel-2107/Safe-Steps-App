import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/assets/images/app_images.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/features/user/my_device/views/widgets/user_info_card.dart';

class LocationGeoFencing extends StatelessWidget {
  const LocationGeoFencing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UserDetailsCard(
      icon: Icons.location_on_outlined,
      title: "Location Geo-Fencing",
      child: Image.asset(
        AppImages.mapImage,
        height: SizeConfig.height * 0.3,
        width: double.infinity,
      ),
    );
  }
}
