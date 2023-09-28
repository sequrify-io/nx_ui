import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class nxSecondaryButton extends HookConsumerWidget {
  const nxSecondaryButton({
    required this.onPressed,
    required this.labelText,
    this.onHighlightChanged,
    this.mouseCursor,
    this.textTheme,
    this.disabledTextColor,
    this.disabledColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.padding,
    this.visualDensity,
    this.shape,
    this.focusNode,
    this.materialTapTargetSize,
    this.animationDuration,
    this.minWidth,
    this.height,
    this.onLongPress,
    this.image,
    this.linearGradient,
    this.textColor,
    this.textStyle,
    super.key,
  });
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final Function(bool)? onHighlightChanged;
  final MouseCursor? mouseCursor;
  final ButtonTextTheme? textTheme;
  final Color? disabledTextColor;
  final Color? disabledColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Brightness? colorBrightness;
  final double? elevation;
  final double? focusElevation;
  final double? hoverElevation;
  final double? highlightElevation;
  final double? disabledElevation;
  final EdgeInsetsGeometry? padding;
  final VisualDensity? visualDensity;
  final ShapeBorder? shape;
  final Clip clipBehavior = Clip.none;
  final FocusNode? focusNode;
  final bool autofocus = false;
  final MaterialTapTargetSize? materialTapTargetSize;
  final Duration? animationDuration;
  final double? minWidth;
  final double? height;
  final bool enableFeedback = true;
  final String labelText;
  final Image? image;
  final Color? textColor;
  final TextStyle? textStyle;
  final LinearGradient? linearGradient;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHighlightChanged: onHighlightChanged,
      textTheme: textTheme,
      disabledTextColor: disabledTextColor,
      disabledColor: disabledColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      splashColor: splashColor,
      colorBrightness: colorBrightness,
      elevation: elevation,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      highlightElevation: highlightElevation,
      disabledElevation: disabledElevation,
      visualDensity: visualDensity,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      materialTapTargetSize: materialTapTargetSize,
      animationDuration: animationDuration,
      minWidth: minWidth,
      height: height,
      enableFeedback: enableFeedback,
      shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      padding: padding ?? const EdgeInsets.all(0),
      child: Ink(
        decoration: BoxDecoration(
          gradient: linearGradient ??
              const LinearGradient(
                begin: Alignment(0.5, 0),
                end: Alignment(0.5, 1),
                colors: [Color(0xff633edb), Color(0xff6e32b5)],
              ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Container(
          width: 120,
          height: 50,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                labelText,
                style: textStyle ?? Theme.of(context).textTheme.labelSmall?.copyWith(color: textColor ?? Theme.of(context).colorScheme.onSurfaceVariant, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                width: 10,
              ),
              image ??
                  const Image(
                    image: AssetImage('assets/icon-arrow-right-button-white.png', package: 'nx_ui'),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
