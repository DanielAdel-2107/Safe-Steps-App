import 'package:flutter/material.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/extensions/app_extensions.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/user/home/models/drawer_item_model.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.drawerItemModel,
  });
  final DrawerItemModel drawerItemModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: SizeConfig.height * 0.02,
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.kThirdColor),
        ),
        leading: Icon(
          drawerItemModel.icon,
          color: AppColors.kThirdColor,
        ),
        title: Text(
          drawerItemModel.title,
          style: AppTextStyles.title18ThirdColorW500,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: AppColors.kThirdColor,
        ),
        onTap: () {
          context.pushScreen(drawerItemModel.routeName);
        },
      ),
    );
  }
}
