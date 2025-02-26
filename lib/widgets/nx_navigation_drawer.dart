import 'package:flutter/material.dart';

import 'package:nx_ui/models/destination.dart';

/// A Material 3 style navigation drawer with support for destinations and sign-out functionality.
///
/// This widget extends Flutter's [NavigationDrawer] with additional features:
/// * List of destinations with selected and unselected icons
/// * Optional sign-out destination at the bottom
/// * Customizable header with "Menu" text
/// * Theme-aware styling with extensive customization options
/// * Optional Sequrify branding button
///
/// The drawer uses Material 3's navigation rail style with indicator highlighting
/// for the selected destination.
///
/// Example usage:
/// ```dart
/// NxCustomNavigationDrawer(
///   destinations: [
///     Destination(
///       'Profile',
///       Icon(Icons.person_outline),  // Unselected state
///       Icon(Icons.person),         // Selected state
///     ),
///     Destination(
///       'Settings',
///       Icon(Icons.settings_outline),
///       Icon(Icons.settings),
///     ),
///   ],
///   selectedIndex: 0,
///   onDestinationSelected: (index) {
///     // Handle destination selection
///   },
///   signOutDestination: Destination(
///     'Sign out',
///     Icon(Icons.logout_outlined),
///     Icon(Icons.logout),
///   ),
/// )
/// ```
///
/// The drawer automatically handles selection state and provides visual feedback
/// through the indicator color and shape.
class NxCustomNavigationDrawer extends StatelessWidget {
  /// Creates a Material 3 style navigation drawer.
  ///
  /// * [destinations] - List of navigation destinations
  /// * [onDestinationSelected] - Callback when destination is selected
  /// * [selectedIndex] - Currently selected destination index
  /// * [signOutDestination] - Optional sign out destination at bottom
  /// * [headerTextStyle] - Style for "Menu" text
  /// * [optionTextStyle] - Style for destination labels
  /// * [sequrifyButton] - Optional branding button
  /// * [backgroundColor] - Drawer background color
  /// * [elevation] - Drawer elevation/shadow
  /// * [shadowColor] - Color of the drawer's shadow
  /// * [surfaceTintColor] - Color used for surface tinting
  /// * [indicatorColor] - Color of the selection indicator
  /// * [indicatorShape] - Shape of the selection indicator
  const NxCustomNavigationDrawer({
    required this.destinations,
    super.key,
    this.onDestinationSelected,
    this.selectedIndex,
    this.signOutDestination,
    this.optionTextStyle,
    this.sequrifyButton,
    this.backgroundColor,
    this.elevation,
    this.headerTextStyle,
    this.shadowColor,
    this.surfaceTintColor,
    this.indicatorColor,
    this.indicatorShape,
  });

  /// Called when the user selects a destination.
  ///
  /// The index parameter is the index of the selected destination,
  /// where 0 represents the first destination.
  final Function(int)? onDestinationSelected;

  /// The index of the currently selected destination.
  ///
  /// If null, no destination will be highlighted as selected.
  final int? selectedIndex;

  /// The list of destinations to display in the drawer.
  ///
  /// Each [Destination] contains a label and icons for selected/unselected states.
  /// The destinations are displayed in order, with the sign-out destination
  /// (if provided) always appearing at the bottom.
  final List<Destination> destinations;

  /// Optional destination for the sign-out action.
  ///
  /// If provided, adds a sign-out option at the bottom of the drawer,
  /// separated by a divider.
  final Destination? signOutDestination;

  /// Text style for the "Menu" header text.
  ///
  /// If null, uses the theme's titleLarge text style.
  final TextStyle? headerTextStyle;

  /// Text style for the destination labels.
  ///
  /// This affects all destinations including the sign-out destination.
  final TextStyle? optionTextStyle;

  /// Optional widget shown above the sign-out option.
  ///
  /// Typically used for branding or additional actions.
  final Widget? sequrifyButton;

  /// Background color of the drawer.
  ///
  /// If null, uses the default navigation drawer background color from the theme.
  final Color? backgroundColor;

  /// Z-coordinate at which to place the drawer relative to its parent.
  ///
  /// This controls the size of the shadow below the drawer.
  final double? elevation;

  /// Color of the drawer's shadow.
  ///
  /// Only visible when [elevation] is greater than 0.
  final Color? shadowColor;

  /// Color used for surface tinting.
  ///
  /// In Material 3, surface tint is a semi-transparent overlay that can be
  /// applied to surface colors to create hierarchy.
  final Color? surfaceTintColor;

  /// Color of the selection indicator.
  ///
  /// This is the color of the highlight shown behind the selected destination.
  final Color? indicatorColor;

  /// Shape of the selection indicator.
  ///
  /// Defines the shape of the highlight shown behind the selected destination.
  /// If null, uses the default stadium border shape.
  final ShapeBorder? indicatorShape;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,
      indicatorColor: indicatorColor,
      indicatorShape: indicatorShape,
      backgroundColor: backgroundColor,
      onDestinationSelected: onDestinationSelected,
      selectedIndex: selectedIndex,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Text(
            'Menu',
            style: headerTextStyle ?? Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 0, 28, 10),
          child: Divider(),
        ),
        ...destinations.map(
          (Destination destination) {
            return NavigationDrawerDestination(
              label: Text(destination.label),
              icon: destination.icon,
              selectedIcon: destination.selectedIcon,
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 30, 28, 10),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: sequrifyButton,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        if (signOutDestination != null)
          NavigationDrawerDestination(
            label: Text(
              signOutDestination!.label,
              style: optionTextStyle,
            ),
            icon: signOutDestination!.icon,
            selectedIcon: signOutDestination!.selectedIcon,
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}
