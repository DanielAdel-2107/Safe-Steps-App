import 'package:flutter/material.dart';
import 'package:safe_steps/features/user/services/views/widgets/services_screen_body.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ServicesScreenBody(),
    );
  }
}

