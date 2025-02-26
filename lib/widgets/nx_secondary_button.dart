import 'package:flutter/material.dart';

/// A customizable outlined button widget with consistent styling.
///
/// This button is designed to be used as a secondary action, perfect for
/// cancel actions, optional choices, or less prominent actions in forms and dialogs.
///
/// The button's appearance can be customized using:
/// * [buttonStyle] - Complete style override
/// * [buttonTextStyle] - Text style for the button label
/// * [margin] - Space around the button (defaults to vertical margin of 16)
/// * [buttonWidth] - Width of the button (defaults to full width)
/// * [buttonHeight] - Height of the button
///
/// Example:
/// ```dart
/// NxSecondaryButton(
///   text: 'Cancel',
///   onPressed: () {
///     // Handle button press
///   },
///   buttonWidth: 155,
///   buttonHeight: 50,
///   margin: EdgeInsets.all(8),
/// )
/// ```
class NxSecondaryButton extends StatelessWidget {
  /// Creates a secondary button with outlined style.
  ///
  /// * [text] - The button's label text
  /// * [onPressed] - Callback when button is pressed, null disables the button
  /// * [buttonTextStyle] - Optional text style for the label
  /// * [margin] - Space around the button, defaults to vertical margin of 16
  /// * [buttonWidth] - Button width, defaults to full width
  /// * [buttonHeight] - Optional fixed height for the button
  /// * [buttonStyle] - Optional complete style override
  const NxSecondaryButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.buttonTextStyle,
    this.margin = const EdgeInsets.symmetric(vertical: 16),
    this.buttonWidth = double.maxFinite,
    this.buttonHeight,
    this.buttonStyle,
  });

  /// The text to display on the button.
  final String text;

  /// Called when the button is tapped or otherwise activated.
  ///
  /// If this is null, the button will be disabled.
  final VoidCallback? onPressed;

  /// The empty space to surround the button with.
  ///
  /// Defaults to vertical margin of 16 logical pixels.
  final EdgeInsetsGeometry? margin;

  /// The text style to use for the button's label.
  ///
  /// If null, the button will use the default text style for [OutlinedButton].
  final TextStyle? buttonTextStyle;

  /// The width of the button.
  ///
  /// Defaults to [double.maxFinite] which makes the button expand to fill its parent.
  final double? buttonWidth;

  /// The height of the button.
  ///
  /// If null, the button will size itself to its content.
  final double? buttonHeight;

  /// Style configuration for the button.
  ///
  /// This allows complete customization of the button's appearance.
  /// If null, the default [OutlinedButton] style will be used.
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        child: SizedBox(
          width: buttonWidth,
          height: buttonHeight,
          child: OutlinedButton(
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
