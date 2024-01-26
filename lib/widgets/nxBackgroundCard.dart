import 'package:flutter/material.dart';

class NxBackgroundCard extends StatelessWidget {
  const NxBackgroundCard({
    required this.child,
    this.height,
    this.width,
    this.backgroundColor,
    this.margin,
    this.elevation,
    this.shape,
    super.key,
  });

  final Widget child;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final ShapeBorder? shape;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * (height ?? 1.0),
      width: MediaQuery.of(context).size.width * (width ?? 1.0),
      child: Card(
        color: backgroundColor ?? Colors.white,
        margin: margin ?? EdgeInsets.zero,
        elevation: elevation ?? 10,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: shape ??
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            ),
        child: child,
      ),
    );
  }
}
