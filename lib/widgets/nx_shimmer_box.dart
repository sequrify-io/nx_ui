import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class NxShimmerBox extends StatelessWidget {
  const NxShimmerBox({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.opacity = 1,
    this.color,
  });

  final double width;
  final double height;
  final double opacity;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      color: Theme.of(context).colorScheme.surfaceVariant,
      colorOpacity: opacity,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
