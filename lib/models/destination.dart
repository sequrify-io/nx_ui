import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A model class representing a navigation destination in a drawer or navigation bar.
///
/// Each destination consists of:
/// * A [label] displayed next to or below the icon
/// * An [icon] shown when the destination is not selected
/// * A [selectedIcon] shown when the destination is selected
///
/// Example usage:
/// ```dart
/// final destinations = [
///   Destination(
///     'Profile',
///     profileOutlinedIcon,  // Unselected state icon
///     profileFilledIcon,    // Selected state icon
///   ),
///   Destination(
///     'Settings',
///     settingsOutlinedIcon,
///     settingsFilledIcon,
///   ),
/// ];
/// ```
///
/// This class is designed to work with [NavigationDrawer]. The icons typically
/// form a pair where one is the outlined version and the other is the filled version
/// of the same icon.
///
/// Example usage with [NavigationDrawer]:
/// ```dart
/// final destinations = [
///   Destination(
///     'Profile',
///     Icon(Icons.person_outline),  // Outlined version for unselected state
///     Icon(Icons.person),         // Filled version for selected state
///   ),
///   Destination(
///     'Settings',
///     Icon(Icons.settings_outlined),
///     Icon(Icons.settings),
///   ),
/// ];
///
/// NavigationDrawer(
///   destinations: destinations.map((d) =>
///     NavigationDrawerDestination(
///       icon: d.icon,
///       selectedIcon: d.selectedIcon,
///       label: Text(d.label),
///     ),
///   ).toList(),
/// )
/// ```
///
/// Common icon pairs:
/// * Profile: [Icons.person_outline] and [Icons.person]
/// * Settings: [Icons.settings_outlined] and [Icons.settings]
/// * Home: [Icons.home_outlined] and [Icons.home]
/// * Notifications: [Icons.notifications_outlined] and [Icons.notifications]
class Destination {
  /// Creates a new navigation destination.
  ///
  /// * [label] is the text displayed next to or below the icon
  /// * [icon] is shown in the unselected state
  /// * [selectedIcon] is shown in the selected state
  const Destination(
    this.label,
    this.icon,
    this.selectedIcon,
  );

  /// The text label displayed for this destination.
  ///
  /// This is typically shown:
  /// * Next to the icon in navigation drawers
  /// * Below the icon in bottom navigation bars
  final String label;

  /// The icon displayed when this destination is not selected.
  ///
  /// While typically an [Icon] widget (usually an outlined variant), this can be
  /// any widget. For example:
  /// * [Icon] with outlined style
  /// * [SvgPicture] for SVG icons
  /// * [Image] for custom images
  final Widget icon;

  /// The icon displayed when this destination is selected.
  ///
  /// This should be a selected/active variant of the [icon], typically:
  /// * A filled version if [icon] is outlined
  /// * A highlighted version if [icon] is normal
  /// * A different color or style that indicates active state
  final Widget selectedIcon;
}
