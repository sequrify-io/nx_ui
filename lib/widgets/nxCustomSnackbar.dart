import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class NxCustomSnackBar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar({
    required BuildContext context,
    required String message,
  }) {
    return _showSnackBar(
      context: context,
      message: message,
      color: Colors.red,
      icon: Ionicons.close_circle_outline,
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnackBar({
    required BuildContext context,
    required String message,
  }) {
    return _showSnackBar(
      context: context,
      message: message,
      color: Colors.green,
      icon: Ionicons.checkmark_circle_outline,
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showWarningSnackBar({
    required BuildContext context,
    required String message,
  }) {
    return _showSnackBar(
      context: context,
      message: message,
      color: Colors.orange,
      icon: Ionicons.warning_outline,
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showCustomSnackBar({
    required BuildContext context,
    required String message,
    required Color color,
    IconData? icon,
    int seconds = 2,
    SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating,
  }) {
    return _showSnackBar(
      context: context,
      message: message,
      color: color,
      icon: icon,
      snackBarBehavior: snackBarBehavior,
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _showSnackBar({required BuildContext context, required String message, required Color color, IconData? icon, int seconds = 2, SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: MediaQuery.of(context).size.width * 0.8,
        backgroundColor: color,
        behavior: snackBarBehavior,
        duration: Duration(seconds: seconds),
        content: Row(
          children: [
            if (icon != null) Icon(icon, color: Colors.white) else const SizedBox.shrink(),
            const SizedBox(width: 10),
            Flexible(
              child: SelectableText(
                message,
                // style: TextStyles.paragraphRegular14(Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
