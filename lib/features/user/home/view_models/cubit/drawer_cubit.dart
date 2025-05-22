import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:safe_steps/core/app_route/route_names.dart';
import 'package:safe_steps/features/user/home/models/drawer_item_model.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());
  final key = GlobalKey<ScaffoldState>();
  List<DrawerItemModel> drawerItems = [
    DrawerItemModel(
      icon: Icons.person,
      title: "Edit Profile",
      routeName: RouteNames.profileScreen,
    ),
    DrawerItemModel(
      icon: Icons.password,
      title: "Change Password",
      routeName: '',
    ),
    DrawerItemModel(
      icon: Icons.notifications_none_outlined,
      title: "Notifications",
      routeName: '',
    ),
    DrawerItemModel(
      icon: Icons.home_repair_service_outlined,
      title: "Services",
      routeName: RouteNames.servicesScreen,
    ),
    DrawerItemModel(
      icon: Icons.info_outline,
      title: "About Us",
      routeName: '',
    ),
    DrawerItemModel(
      icon: Icons.settings_outlined,
      title: "Settings",
      routeName: '',
    ),
  ];
  //1 open drawer
  void openDrawer() {
    key.currentState!.openDrawer();
  }

  //2 close drawer
  closeDrawer() {
    key.currentState!.closeDrawer();
  }
}
