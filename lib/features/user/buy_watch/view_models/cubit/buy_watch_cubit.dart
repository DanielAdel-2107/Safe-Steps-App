import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:safe_steps/core/utilies/assets/images/app_images.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';

part 'buy_watch_state.dart';

class BuyWatchCubit extends Cubit<BuyWatchState> {
  BuyWatchCubit() : super(BuyWatchInitial());
  //! change color
  List images = [
    AppImages.blueWatchImage,
    AppImages.accentBlueWatchImage,
    AppImages.blackWatchImage,
    AppImages.whiteWatchImage,
  ];
  List<Color> colors = [
    AppColors.kThirdColor,
    AppColors.kPrimaryColor,
    Colors.black,
    Colors.white,
  ];
  String image = AppImages.accentBlueWatchImage;
  void changeWatchColor(int index) {
    image = images[index];
    emit(ChangeWatchColor(image: images[index]));
  }
}
