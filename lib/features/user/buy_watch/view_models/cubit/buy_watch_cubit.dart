import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:safe_steps/core/cache/cache_helper.dart';
import 'package:safe_steps/core/di/dependancy_injection.dart';
import 'package:safe_steps/core/network/supabase/database/add_data.dart';
import 'package:safe_steps/core/utilies/assets/images/app_images.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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
  List<String> colorsName = [
    "Blue",
    "Accent Blue",
    "Black",
    "White",
  ];
  
  String image = AppImages.blueWatchImage;
  int _index = 0;
  void changeWatchColor(int index) {
    image = images[index];
    _index = index;
    emit(ChangeWatchColor(image: images[index]));
  }

  //!
  buyWatch() async {
    try {
      emit(BuyWatchLoading());
      await addData(tableName: "requests", data: {
        "watch_color": colorsName[_index],
        "user_id": getIt<SupabaseClient>().auth.currentUser!.id,
        "user_name": getIt<CacheHelper>().getUserModel()?.name ?? "Unknown",
      });
      emit(BuyWatchSuccess());
    } catch (e) {
      emit(BuyWatchFailure(message: e.toString()));
    }
  }
}
