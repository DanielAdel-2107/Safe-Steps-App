import 'package:flutter/material.dart';

class DrawerItemModel {
  final String title;
  final IconData icon;
  final String routeName;

  DrawerItemModel(
      {required this.title, required this.icon, required this.routeName});
}
