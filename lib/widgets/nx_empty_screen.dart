import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

/// A widget that displays an empty state with an icon and message.
///
/// This widget is useful for showing placeholder content when there is no data
/// to display, or when a feature is not yet implemented. It shows a centered
/// icon (defaulting to a sad face) with a message below it.
///
/// The widget can be customized with different colors, icons, and dimensions,
/// and automatically adapts to the screen size if no specific dimensions are provided.
///
/// Example usage:
/// ```dart
/// NxEmptyScreen(
///   context: context,
///   information: Text('No items found'),
///   color: Colors.grey[100],
///   icon: Icons.inbox_outlined,
///   height: 300,
/// )
/// ```
class NxEmptyScreen extends StatelessWidget {
  /// Creates an empty screen widget.
  ///
  /// * [context] is required for screen size calculations
  /// * [information] is the message to display below the icon
  /// * [color] sets the background color of the container
  /// * [icon] is the icon to display (defaults to sad face)
  /// * [height] and [width] can be used to override default dimensions
  const NxEmptyScreen({
    required this.context,
    required this.information,
    super.key,
    this.color,
    this.icon = Ionicons.sad_outline,
    this.height,
    this.width,
  });

  /// The build context, used for calculating default dimensions.
  final BuildContext context;

  /// The text widget to display below the icon.
  ///
  /// This should typically be a short message explaining why the screen is empty
  /// or what the user can do next.
  final Text information;

  /// The background color of the container.
  ///
  /// If null, the container will be transparent.
  final Color? color;

  /// The icon to display above the information text.
  ///
  /// Defaults to [Ionicons.sad_outline].
  /// The icon is always displayed in grey color with a size of 25.
  final IconData? icon;

  /// The height of the container.
  ///
  /// If null, defaults to 70% of the screen height.
  final double? height;

  /// The width of the container.
  ///
  /// If null, defaults to the full screen width.
  final double? width;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        height: height ?? MediaQuery.of(context).size.height * 0.7,
        width: width ?? MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 25,
                color: Colors.grey,
              ),
              Padding(padding: const EdgeInsets.all(20), child: information),
            ],
          ),
        ),
      );
}
