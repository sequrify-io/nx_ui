import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class nxPrimaryButton extends HookConsumerWidget {
  const nxPrimaryButton({
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
    this.textColor,
    this.textStyle,
    this.imageEnabled = true,
    this.imageColor,
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
  final bool? imageEnabled;
  final Color? imageColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ButtonTheme(
      minWidth: double.infinity,
      child: MaterialButton(
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
        padding: padding ?? const EdgeInsets.all(10),
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
            ),
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  labelText,
                  style: textStyle ?? Theme.of(context).textTheme.labelSmall?.copyWith(color: textColor ?? Theme.of(context).colorScheme.onSurfaceVariant, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                if (imageEnabled == true)
                  image ??
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Image(
                            color: imageColor,
                            image: const AssetImage('assets/icon-arrow-right-button-white.png', package: 'nx_ui'),
                          ),
                        ],
                      )
                else
                  const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
