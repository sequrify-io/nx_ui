import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

/// A utility class providing snackbar notifications with predefined styles.
///
/// This class offers three predefined styles:
/// * Error snackbar (red with close icon)
/// * Success snackbar (green with checkmark icon)
/// * Warning snackbar (orange with warning icon)
///
/// It also provides a custom snackbar option where you can specify:
/// * Custom background color
/// * Custom icon
/// * Duration (in seconds, defaults to 2)
/// * SnackBar behavior (floating or fixed)
///
/// Example usage:
/// ```dart
/// // Show an error snackbar (fixed 2-second duration)
/// NxCustomSnackBar.showErrorSnackBar(
///   context: context,
///   message: 'An error occurred'
/// );
///
/// // Show a success snackbar (fixed 2-second duration)
/// NxCustomSnackBar.showSuccessSnackBar(
///   context: context,
///   message: 'Operation completed successfully'
/// );
///
/// // Show a custom snackbar with custom duration and behavior
/// NxCustomSnackBar.showCustomSnackBar(
///   context: context,
///   message: 'Custom message',
///   color: Colors.purple,
///   icon: Icons.star,
///   seconds: 5,
///   snackBarBehavior: SnackBarBehavior.fixed,
/// );
/// ```
class NxCustomSnackBar {
  /// Shows a red snackbar with an error icon.
  ///
  /// The snackbar appears for 2 seconds and uses the floating behavior.
  /// Cannot customize duration or behavior.
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showErrorSnackBar({
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

  /// Shows a green snackbar with a checkmark icon.
  ///
  /// The snackbar appears for 2 seconds and uses the floating behavior.
  /// Cannot customize duration or behavior.
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSuccessSnackBar({
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

  /// Shows an orange snackbar with a warning icon.
  ///
  /// The snackbar appears for 2 seconds and uses the floating behavior.
  /// Cannot customize duration or behavior.
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showWarningSnackBar({
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

  /// Shows a snackbar with custom styling options.
  ///
  /// * [context] - The build context
  /// * [message] - The text to display
  /// * [color] - Background color of the snackbar
  /// * [icon] - Optional icon to show before the message
  /// * [seconds] - Duration in seconds (defaults to 2)
  /// * [snackBarBehavior] - Whether the snackbar floats or is fixed (defaults to floating)
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showCustomSnackBar({
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

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      _showSnackBar({
    required BuildContext context,
    required String message,
    required Color color,
    IconData? icon,
    int seconds = 2,
    SnackBarBehavior snackBarBehavior = SnackBarBehavior.floating,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        width: MediaQuery.of(context).size.width * 0.8,
        backgroundColor: color,
        behavior: snackBarBehavior,
        duration: Duration(seconds: seconds),
        content: Row(
          children: [
            if (icon != null)
              Icon(icon, color: Colors.white)
            else
              const SizedBox.shrink(),
            const SizedBox(width: 10),
            Flexible(
              child: SelectableText(
                message,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
