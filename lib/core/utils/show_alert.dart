import 'package:adithya_horoscope/core/app/navigator_key.dart';
import 'package:adithya_horoscope/core/config/loader_config.dart';
import 'package:adithya_horoscope/core/constants/color_constants.dart';
import 'package:adithya_horoscope/presentation/widgets/style.dart';
import 'package:adithya_horoscope/presentation/widgets/text_view.dart';
import 'package:flutter/material.dart';

class MetaAlert {
  static void showErrorAlert({
    String title = "",
    required String message,
    int duration = 2,
  }) {
    MetaProgressHUD.showAndDismiss(message);
    // Get.snackbar(
    //   title,
    //   message,
    //   backgroundColor: Colors.black,
    //   colorText: Colors.white,
    //   duration: Duration(seconds: duration),
    // );
  }

  static void showSnackbar(
      {required String message, int duration = 3, bool error = false}) {
    var snackBar = SnackBar(
      backgroundColor: error ? MetaColors.errorColor : MetaColors.greenColor,
      content: MetaTextView(
        text: message,
        textStyle: const MetaStyle(
            fontSize: 12,
            fontColor: MetaColors.whiteColor,
            fontWeight: FontWeight.w500),
      ),
    );
    ScaffoldMessenger.of(appNavigatorKey.currentState!.context)
        .showSnackBar(snackBar);
  }

  static void showSuccessAlert({
    String title = "",
    required String message,
    int duration = 2,
  }) {
    MetaProgressHUD.showAndDismiss(message);
    // Get.snackbar(
    //   title,
    //   message,
    //   backgroundColor: Colors.black,
    //   colorText: Colors.white,
    //   duration: Duration(seconds: duration),
    // );
  }
}
