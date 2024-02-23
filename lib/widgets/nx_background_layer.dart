import 'package:flutter/material.dart';

class NxBackgroundLayer extends StatelessWidget {
  const NxBackgroundLayer({
    this.backgroundColor,
    this.imagePath,
    this.imageShift = 0.0,
    this.imageOpacity = 1,
    super.key,
  });
  final Color? backgroundColor;
  final String? imagePath;
  final double imageShift;
  final double imageOpacity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: imageShift,
      child: Container(
        color: backgroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: imagePath != null
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath!),
                  fit: BoxFit.fitWidth,
                  opacity: imageOpacity,
                ),
              )
            : null,
      ),
    );
  }
}
