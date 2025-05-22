// ignore_for_file: deprecated_member_use
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:safe_steps/core/app_route/app_routes.dart';
import 'package:safe_steps/core/app_route/route_names.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';




final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig.init(context);
        return MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
          useInheritedMediaQuery: true,
          routes: AppRoutes.routes,
          initialRoute: RouteNames.splashScreen,
        );
      }
    );
  }
}
