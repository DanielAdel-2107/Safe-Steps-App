import 'package:flutter/material.dart';
import 'package:safe_steps/core/components/custom_elevated_button.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';
import 'package:safe_steps/core/utilies/sizes/sized_config.dart';
import 'package:safe_steps/core/utilies/styles/app_text_styles.dart';
import 'package:safe_steps/features/auth/sign%20in/models/user_model.dart';
import 'package:safe_steps/features/user/home/models/drawer_item_model.dart';
import 'package:safe_steps/features/user/home/views/widgets/drawer_list_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.drawerItems,
    required this.userModel,
  });
  final List<DrawerItemModel> drawerItems;
  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: SizeConfig.height * 0.3,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.kThirdColor,
                gradient: LinearGradient(
                  colors: [
                    AppColors.kThirdColor,
                    Colors.grey.shade300,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: userModel.image ==null
                    ? null
                    : NetworkImage(userModel.image!),
              ),
              accountName: Text(
                userModel.name,
                style: AppTextStyles.title20WhiteBold,
              ),
              accountEmail: Text(
                userModel.email,
                style: AppTextStyles.title16White500,
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.height * 0.6,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.width * 0.03,
                vertical: SizeConfig.height * 0.01,
              ),
              itemBuilder: (context, index) => DrawerListTile(
                drawerItemModel: drawerItems[index],
              ),
              itemCount: drawerItems.length,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.03,
            ),
            child: CustomElevatedButton(
              name: "Log Out",
              backgroundColor: AppColors.kThirdColor,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
