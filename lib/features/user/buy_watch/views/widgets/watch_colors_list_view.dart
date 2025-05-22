import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/features/user/buy_watch/view_models/cubit/buy_watch_cubit.dart';
import 'package:safe_steps/features/user/buy_watch/views/widgets/custom_color.dart';

class WatchColorsListView extends StatelessWidget {
  const WatchColorsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BuyWatchCubit>();
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CustomColor(
          onTap: () {
            cubit.changeWatchColor(index);
          },
          color: cubit.colors[index],
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        width: SizeConfig.width * 0.01,
      ),
      itemCount: cubit.colors.length,
    );
  }
}
