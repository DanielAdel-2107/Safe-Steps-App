import 'package:flutter/material.dart';
import 'package:safe_steps/core/app_route/route_names.dart';
import 'package:safe_steps/features/auth/sign%20in/views/screens/sign_in_screen.dart';
import 'package:safe_steps/features/auth/sign%20up/views/screens/sign_up_screen.dart';
import 'package:safe_steps/features/onBoarding/views/screens/on_boarding_screen.dart';
import 'package:safe_steps/features/splash/views/screens/splash_screen.dart';
import 'package:safe_steps/features/user/buy_watch/views/screens/buy_watch_screen.dart';
import 'package:safe_steps/features/user/home/views/screens/home_screen.dart';
import 'package:safe_steps/features/user/medicine_scheduled/views/screens/medicine_scheduled_screen.dart';
import 'package:safe_steps/features/user/my_device/views/screens/my_device_screen.dart';
import 'package:safe_steps/features/user/nurses/views/screens/nurses_screen.dart';
import 'package:safe_steps/features/user/profile/views/screens/profile_screen.dart';
import 'package:safe_steps/features/user/services/views/screens/services_screen.dart';
import 'package:safe_steps/features/user/transportation/views/screens/transportation_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.onBoardingScreen: (context) => const OnBoardingScreen(),
    RouteNames.signInScreen: (context) => const SignInScreen(),
    RouteNames.signUpScreen: (context) => const SignUpScreen(),
    RouteNames.userHomeScreen: (context) => const HomeScreen(),
    RouteNames.buyWatchScreen: (context) => const BuyWatchScreen(),
    RouteNames.profileScreen: (context) => ProfileScreen(),
    RouteNames.servicesScreen: (context) => ServicesScreen(),
    RouteNames.medicineScheduledScreen: (context) => MedicineScheduledScreen(),
    RouteNames.myDeviceScreen: (context) => MyDeviceScreen(),
    RouteNames.nursesScreen: (context) => NursesScreen(),
    RouteNames.transportationScreen: (context) => TransportationScreen(),
  };
}
