import 'package:flutter/material.dart';

class NxSecondaryButton extends StatelessWidget {
  const NxSecondaryButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.buttonTextStyle,
    this.margin = const EdgeInsets.symmetric(vertical: 16),
    this.buttonWidth = double.maxFinite,
    this.buttonHeight,
    this.buttonStyle,
    this.borderRadius,
  });
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;
  final TextStyle? buttonTextStyle;
  final double? buttonWidth;
  final double? buttonHeight;
  final ButtonStyle? buttonStyle;
  final double? borderRadius;

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
