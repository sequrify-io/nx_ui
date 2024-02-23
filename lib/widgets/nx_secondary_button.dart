import 'package:flutter/material.dart';

class NxSecondaryButton extends StatelessWidget {
  const NxSecondaryButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.buttonColor,
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
  final Color? buttonColor;
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
            style: buttonStyle ??
                OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 30),
                  ),
                  padding: const EdgeInsets.all(12),
                  side: const BorderSide(),
                ),
            onPressed: onPressed,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: buttonTextStyle ??
                  const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Roboto',
                    color: const Color(0xFF5F3ECC),
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      );
}
