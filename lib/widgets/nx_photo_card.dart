import 'package:flutter/material.dart';

class NxPhotoCard extends StatelessWidget {
  const NxPhotoCard({
    super.key,
    this.imagePath,
    this.elevation,
    this.child,
    this.height,
    this.width,
  });

  final String? imagePath;
  final double? elevation;
  final Widget? child;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: child ??
            (imagePath != null
                ? Image.asset(
                    imagePath!,
                    fit: BoxFit.cover,
                    width: width ?? double.infinity,
                    height: height ?? 200,
                  )
                : const Placeholder(
                    fallbackHeight: 200,
                    fallbackWidth: double.infinity,
                  )),
      ),
    );
  }
}
