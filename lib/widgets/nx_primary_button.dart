import 'package:flutter/material.dart';

class NxPrimaryButton extends StatelessWidget {
  const NxPrimaryButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.buttonColor,
    this.buttonDisableColor,
    this.buttonTextStyle,
    this.margin = const EdgeInsets.symmetric(vertical: 16),
    this.buttonWidth = double.maxFinite,
    this.buttonHeight,
    this.buttonElevation,
    this.borderRadius,
  });
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? margin;
  final Color? buttonColor;
  final Color? buttonDisableColor;
  final TextStyle? buttonTextStyle;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? buttonElevation;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        child: MaterialButton(
          height: buttonHeight,
          minWidth: buttonWidth,
          elevation: buttonElevation ?? 0,
          color: buttonColor ?? const Color(0xFF5F3ECC),
          disabledColor: buttonDisableColor ?? const Color(0xFF5F3ECC),
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 30),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: buttonTextStyle ??
                const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      );
}
