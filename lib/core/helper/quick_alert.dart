
import 'package:safe_steps/app/my_app.dart';
import 'package:safe_steps/core/utilies/colors/app_colors.dart';

import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

quickAlert({required QuickAlertType type, String? title, String? text}) {
  QuickAlert.show(
    context: navigatorKey.currentState!.context,
    type: type,
    headerBackgroundColor: AppColors.kPrimaryColor,
    confirmBtnColor: AppColors.kPrimaryColor,
    title: title,
    text: text,
  );
}
