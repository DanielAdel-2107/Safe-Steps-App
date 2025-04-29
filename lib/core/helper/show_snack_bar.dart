import 'package:flutter/material.dart';
import 'package:safe_steps/app/my_app.dart';


showSnackBar({required String title}) {
  ScaffoldMessenger.of(navigatorKey.currentState!.context).showSnackBar(
    SnackBar(
      content: Text(title),
    ),
  );
}
