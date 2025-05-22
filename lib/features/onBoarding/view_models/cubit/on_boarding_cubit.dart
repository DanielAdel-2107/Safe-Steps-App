import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_steps/features/onBoarding/view_models/cubit/on_boarding_state.dart';
import 'package:safe_steps/features/onBoarding/views/widgets/get_started.dart';
import 'package:safe_steps/features/onBoarding/views/widgets/smart_health.dart';
import 'package:safe_steps/features/onBoarding/views/widgets/support.dart';
import 'package:safe_steps/features/onBoarding/views/widgets/tarck_with_reminders.dart';
import 'package:safe_steps/features/onBoarding/views/widgets/welcome_to_safe_steps.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());
  final pageIndectorController = PageController();
  int initialPage = 0;
  nextPage() {
    pageIndectorController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    initialPage = pageIndectorController.page!.toInt();
    emit(ChangePageState());
  }

  pageChanged(int index) {
    initialPage = index;
    emit(ChangePageState());
  }

  final List<Widget> onBoardingSteps = [
    WelcomeToSafeSteps(),
    SmartHealth(),
    TrackWithReminders(),
    Support(),
    GetStarted(),
  ];
}
