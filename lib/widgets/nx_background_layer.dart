import 'package:flutter/material.dart';

/// A widget that creates a full-screen background layer with support for images or solid colors.
///
/// This widget can display either:
/// * An image from assets or network as a background
/// * A solid color background
///
/// The widget automatically sizes itself to fill the screen and can be positioned
/// with an optional vertical shift.
///
/// Example usage with asset image:
/// ```dart
/// NxBackgroundLayer(
///   fromAssets: true,
///   imagePath: 'assets/images/background.jpg',
///   imageOpacity: 0.8,
/// )
/// ```
///
/// Example usage with network image:
/// ```dart
/// NxBackgroundLayer(
///   fromAssets: false,
///   imagePath: 'https://example.com/background.jpg',
/// )
/// ```
///
/// Example usage with solid color:
/// ```dart
/// NxBackgroundLayer(
///   backgroundColor: Colors.black.withOpacity(0.3),
/// )
/// ```
class NxBackgroundLayer extends StatelessWidget {
  /// Creates a background layer widget.
  ///
  /// * [fromAssets] determines if the image should be loaded from assets
  /// * [backgroundColor] sets a solid background color
  /// * [imagePath] specifies the path to the image (asset or network URL)
  /// * [imageShift] adjusts the vertical position of the background
  /// * [imageOpacity] sets the opacity of the background image
  const NxBackgroundLayer({
    this.fromAssets = true,
    this.backgroundColor,
    this.imagePath,
    this.imageShift = 0.0,
    this.imageOpacity = 1,
    super.key,
  });

  /// Whether to load the image from assets.
  ///
  /// If true, [imagePath] is treated as an asset path.
  /// If false, [imagePath] is treated as a network URL.
  /// Defaults to true.
  final bool fromAssets;

  /// The background color to use when no image is provided.
  ///
  /// This color is also visible when the image has transparency
  /// or when [imageOpacity] is less than 1.0.
  final Color? backgroundColor;

  /// The path to the background image.
  ///
  /// When [fromAssets] is true, this should be an asset path (e.g., 'assets/images/background.jpg').
  /// When [fromAssets] is false, this should be a network URL.
  final String? imagePath;

  /// The vertical offset of the background from the bottom of the screen.
  ///
  /// A positive value moves the background upward.
  /// Defaults to 0.0.
  final double imageShift;

  /// The opacity of the background image.
  ///
  /// Value should be between 0.0 (fully transparent) and 1.0 (fully opaque).
  /// Only applies to asset images.
  /// Defaults to 1.0.
  final double imageOpacity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: imageShift,
      child: fromAssets != true && imagePath != null
          ? Image.network(
              imagePath!,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            )
          : Container(
              color: backgroundColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: fromAssets == true && imagePath != null
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
