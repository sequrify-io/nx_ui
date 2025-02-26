import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

/// A loading placeholder widget that displays a shimmer animation effect.
///
/// This widget creates a container with a shimmering animation, commonly used
/// to indicate loading states in the UI. The shimmer effect moves across the
/// container, creating a subtle loading animation.
///
/// Example usage:
/// ```dart
/// // Basic shimmer box with default size
/// NxShimmerBox()
///
/// // Custom sized shimmer box
/// NxShimmerBox(
///   width: 200,
///   height: 100,
///   opacity: 0.8,
///   color: Colors.grey[300],
/// )
///
/// // Loading card with shimmer effect
/// Card(
///   child: Padding(
///     padding: EdgeInsets.all(16),
///     child: Column(
///       children: [
///         NxShimmerBox(
///           height: 24,
///           width: double.infinity,
///         ),
///         SizedBox(height: 8),
///         NxShimmerBox(
///           height: 100,
///           width: double.infinity,
///         ),
///       ],
///     ),
///   ),
/// )
/// ```
class NxShimmerBox extends StatelessWidget {
  /// Creates a shimmer box widget.
  ///
  /// * [width] - Width of the box (defaults to screen width)
  /// * [height] - Height of the box (defaults to screen height)
  /// * [opacity] - Opacity of the shimmer effect (defaults to 1.0)
  /// * [color] - Background color of the box
  const NxShimmerBox({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.opacity = 1,
    this.color,
  });

  /// The width of the shimmer box.
  ///
  /// Defaults to [double.infinity] which takes up all available width.
  final double width;

  /// The height of the shimmer box.
  ///
  /// Defaults to [double.infinity] which takes up all available height.
  final double height;

  /// The opacity of the shimmer effect.
  ///
  /// Value should be between 0.0 (fully transparent) and 1.0 (fully opaque).
  /// Defaults to 1.0.
  final double opacity;

  /// The background color of the box.
  ///
  /// If null, the box will be transparent and only the shimmer effect will be visible.
  /// The shimmer effect uses the surface container color from the current theme.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      colorOpacity: opacity,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
