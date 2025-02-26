import 'package:flutter/material.dart';

/// A customizable card widget that sizes itself relative to the screen dimensions.
///
/// This widget wraps Flutter's [Card] widget and adds convenient sizing functionality
/// by allowing height and width to be specified as fractions of the screen size.
/// It also provides common customization options like elevation, shape, and scrolling.
///
/// Example usage:
/// ```dart
/// NxBackgroundCard(
///   height: 0.5, // Takes up half the screen height
///   elevation: 20,
///   child: Column(
///     children: [
///       Text('Card Content'),
///       // ... other widgets
///     ],
///   ),
/// )
/// ```
///
/// The card automatically applies rounded corners at the top edges by default,
/// making it suitable for bottom-sheet style interfaces when positioned at the
/// bottom of the screen.
class NxBackgroundCard extends StatelessWidget {
  /// Creates a background card that sizes relative to screen dimensions.
  ///
  /// * [child] is the widget to display inside the card
  /// * [height] is the fraction of screen height to occupy (1.0 = full height)
  /// * [width] is the fraction of screen width to occupy (1.0 = full width)
  /// * [backgroundColor] sets the card's background color
  /// * [margin] defines the space around the card
  /// * [elevation] controls the card's shadow
  /// * [shape] defines the card's shape and border radius
  /// * [isScrollable] wraps content in [SingleChildScrollView] if true
  const NxBackgroundCard({
    required this.child,
    this.height,
    this.width,
    this.backgroundColor,
    this.margin,
    this.elevation,
    this.shape,
    this.isScrollable = false,
    super.key,
  });

  /// The widget to display inside the card.
  final Widget child;

  /// The height of the card as a fraction of screen height.
  ///
  /// For example, 0.5 means the card will take up half the screen height.
  /// If null, defaults to 1.0 (full screen height).
  final double? height;

  /// The width of the card as a fraction of screen width.
  ///
  /// For example, 0.5 means the card will take up half the screen width.
  /// If null, defaults to 1.0 (full screen width).
  final double? width;

  /// The background color of the card.
  ///
  /// If null, uses the default card color from the theme.
  final Color? backgroundColor;

  /// The empty space around the card.
  ///
  /// If null, defaults to [EdgeInsets.zero].
  final EdgeInsetsGeometry? margin;

  /// The z-coordinate at which to place this card relative to its parent.
  ///
  /// This controls the size of the shadow below the card.
  /// If null, defaults to 10.
  final double? elevation;

  /// The shape of the card's border.
  ///
  /// If null, defaults to rounded corners of 40 logical pixels on the top edges.
  final ShapeBorder? shape;

  /// Whether the card's content should be scrollable.
  ///
  /// If true, wraps the [child] in a [SingleChildScrollView].
  /// Defaults to false.
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * (height ?? 1.0),
      width: MediaQuery.of(context).size.width * (width ?? 1.0),
      child: Card(
        color: backgroundColor,
        margin: margin ?? EdgeInsets.zero,
        elevation: elevation ?? 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: shape ??
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
            ),
        child: isScrollable
            ? SingleChildScrollView(
                child: child,
              )
            : child,
      ),
    );
  }
}
