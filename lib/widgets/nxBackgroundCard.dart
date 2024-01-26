import 'package:flutter/material.dart';

class NxBackgroundCard extends StatelessWidget {
  const NxBackgroundCard({
    required this.child,
    this.height,
    this.width,
    this.backgroundColor,
    super.key,
  });

  final Widget child;
  final double? height;
  final double? width;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * (height ?? 1.0),
      width: MediaQuery.of(context).size.width * (width ?? 1.0),
      child: Card(
        color: backgroundColor ?? Colors.white,
        margin: EdgeInsets.zero,
        elevation: 10,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
        ),
        child: child,
      ),
    );
  }
}
