import 'package:flutter/material.dart';

/// A customizable filled button widget with consistent styling.
///
/// This button is designed to be used as the primary call-to-action in forms
/// and dialogs. It uses Flutter's [FilledButton] to provide a prominent, filled
/// appearance that draws attention to the primary action.
///
/// The button's appearance can be customized using:
/// * [buttonStyle] - Complete style override using Flutter's [ButtonStyle]
/// * [buttonTextStyle] - Text style for the button label
/// * [margin] - Space around the button (defaults to vertical margin of 16)
/// * [buttonWidth] - Width of the button (defaults to full width)
/// * [buttonHeight] - Height of the button
///
/// The [buttonStyle] controls the button's appearance (background, elevation, etc.)
/// while [buttonTextStyle] independently controls the text appearance.
///
/// Example:
/// ```dart
/// NxPrimaryButton(
///   text: 'Submit',
///   onPressed: () {
///     // Handle button press
///   },
///   buttonWidth: 155,
///   buttonHeight: 50,
///   margin: EdgeInsets.all(8),
///   buttonTextStyle: TextStyle(fontSize: 16),
///   buttonStyle: FilledButton.styleFrom(
///     backgroundColor: Colors.blue,
///     foregroundColor: Colors.white,
///   ),
/// )
/// ```
class NxPrimaryButton extends StatelessWidget {
  /// Creates a primary button with filled style.
  ///
  /// * [text] - The button's label text
  /// * [onPressed] - Callback when button is pressed, null disables the button
  /// * [buttonTextStyle] - Optional text style for the label
  /// * [margin] - Space around the button, defaults to vertical margin of 16
  /// * [buttonWidth] - Button width, defaults to full width
  /// * [buttonHeight] - Optional fixed height for the button
  /// * [buttonStyle] - Optional complete style override
  const NxPrimaryButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.buttonTextStyle,
    this.margin = const EdgeInsets.symmetric(vertical: 16),
    this.buttonWidth = double.maxFinite,
    this.buttonHeight,
    this.buttonStyle,
  });
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;
  final TextStyle? buttonTextStyle;
  final double? buttonWidth;
  final double? buttonHeight;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        child: SizedBox(
          width: buttonWidth,
          height: buttonHeight,
          child: FilledButton(
            style: buttonStyle,
            onPressed: onPressed,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: buttonTextStyle,
            ),
          ),
        ),
      );
}
