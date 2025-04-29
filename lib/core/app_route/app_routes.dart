import 'package:flutter/material.dart';
import 'package:safe_steps/core/app_route/route_names.dart';
import 'package:safe_steps/features/auth/sign%20in/views/screens/sign_in_screen.dart';
import 'package:safe_steps/features/auth/sign%20up/views/screens/sign_up_screen.dart';
import 'package:safe_steps/features/onBoarding/views/screens/on_boarding_screen.dart';
import 'package:safe_steps/features/splash/views/screens/splash_screen.dart';
import 'package:safe_steps/features/user/buy_watch/views/screens/buy_watch_screen.dart';
import 'package:safe_steps/features/user/home/views/screens/home_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.onBoardingScreen: (context) => const OnBoardingScreen(),
    RouteNames.signInScreen: (context) => const SignInScreen(),
    RouteNames.signUpScreen: (context) => const SignUpScreen(),
    RouteNames.userHomeScreen: (context) => const HomeScreen(),
    RouteNames.buyWatchScreen: (context) => const BuyWatchScreen(),
    // //
    // RouteNames.parentHomeScreen: (context) => const ParentHomeScreen(),
    // RouteNames.babySitterDetailsScreen: (context) =>
    //     const BabySitterDetailsScreen(),
    // RouteNames.bookBabySitterScreen: (context) => const BookBabySitterScreen(),
    // RouteNames.parentRequetsScreen: (context) => const ParentRequetsScreen(),
    // RouteNames.geminiChatScreen: (context) => BlocProvider(
    //       create: (context) => ChatGeminiCubit(),
    //       child: GeminiChatScreen(),
    //     ),
    // //
    // RouteNames.updateProfileScreen: (context) => const UpdateProfileScreen(),
    // RouteNames.myRequestsScreen: (context) => const MyRequestsScreen(),
    // RouteNames.chatScreen: (context) => const ChatScreen(),
  };
}
