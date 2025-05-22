import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_steps/core/helper/show_clipper_dialog.dart';
import 'package:safe_steps/core/utilies/extensions/app_extensions.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/features/user/buy_watch/view_models/cubit/buy_watch_cubit.dart';
import 'package:safe_steps/features/user/buy_watch/views/widgets/watch_details.dart';

class BuyWatchScreenBody extends StatelessWidget {
  const BuyWatchScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BuyWatchCubit(),
      child: BlocConsumer<BuyWatchCubit, BuyWatchState>(
        listener: (context, state) {
          if (state is BuyWatchSuccess) {
            context.popScreen();
            showCustomClipperDialog(
              title: "Success",
              message: "Request Sent Successfully",
            );
          }
          if (state is BuyWatchFailure) {
            showCustomClipperDialog(
              title: "Failure",
              message: state.message,
            );
          }
        },
        builder: (context, state) {
          var cubit = context.read<BuyWatchCubit>();
          return Column(
            children: [
              Image.asset(
                cubit.image,
                width: SizeConfig.width * 0.6,
                height: SizeConfig.height * 0.45,
                fit: BoxFit.fill,
              ),
              WatchDetails(),
            ],
          );
        },
      ),
    );
  }
}
