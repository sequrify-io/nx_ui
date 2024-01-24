import 'package:flutter/material.dart';

class NxBackgroundImage extends StatelessWidget {
  const NxBackgroundImage({
    required this.imagePath,
    this.imageShift = 0.0,
    this.opacity = 1,
    super.key,
  });
  final String imagePath;
  final double imageShift;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: imageShift,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fitWidth,
            opacity: opacity,
          ),
        ),
      ),
    );
  }
}
