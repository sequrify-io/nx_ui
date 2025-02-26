import 'package:flutter/material.dart';

/// A card widget for displaying images with fallback support.
///
/// This widget wraps an image in a [Card] with rounded corners. It can display:
/// * An asset image specified by [imagePath]
/// * A custom widget specified by [child]
/// * A placeholder when no image or child is provided
///
/// Example usage:
/// ```dart
/// // Basic photo card with asset image
/// NxPhotoCard(
///   imagePath: 'assets/images/photo.jpg',
///   height: 200,
///   width: double.infinity,
///   elevation: 4,
/// )
///
/// // Photo card with custom child widget
/// NxPhotoCard(
///   height: 200,
///   width: double.infinity,
///   child: Image.network(
///     'https://example.com/image.jpg',
///     fit: BoxFit.cover,
///   ),
/// )
///
/// // Photo card without image (shows placeholder)
/// NxPhotoCard(
///   height: 150,
///   width: 200,
/// )
/// ```
class NxPhotoCard extends StatelessWidget {
  /// Creates a photo card widget.
  ///
  /// * [imagePath] - Path to the asset image to display
  /// * [elevation] - Card's elevation (shadow)
  /// * [child] - Custom widget to display instead of an image
  /// * [height] - Height of the card
  /// * [width] - Width of the card
  const NxPhotoCard({
    super.key,
    this.imagePath,
    this.elevation,
    this.child,
    this.height,
    this.width,
  });

  /// The path to the asset image to display.
  ///
  /// If null and no [child] is provided, a placeholder will be shown.
  final String? imagePath;

  /// The z-coordinate at which to place this card relative to its parent.
  ///
  /// This controls the size of the shadow below the card.
  /// If null, defaults to 0 (no elevation).
  final double? elevation;

  /// A custom widget to display instead of an asset image.
  ///
  /// If provided, this widget will be displayed instead of the [imagePath] image.
  /// The widget will be clipped to have rounded corners.
  final Widget? child;

  /// The height of the card.
  ///
  /// If null, defaults to 200 logical pixels when showing an image or placeholder.
  /// When using a custom [child], its height will be used if this is null.
  final double? height;

  /// The width of the card.
  ///
  /// If null, defaults to [double.infinity] when showing an image or placeholder.
  /// When using a custom [child], its width will be used if this is null.
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
