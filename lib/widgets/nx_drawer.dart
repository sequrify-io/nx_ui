import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A customizable drawer widget with support for navigation options and sign-out functionality.
///
/// This widget extends Flutter's [Drawer] with additional features:
/// * Configurable navigation options with icons
/// * Optional sign-out button at the bottom
/// * Customizable header (defaults to "Menu")
/// * Theme-aware styling with customization options
/// * Optional Sequrify branding button
///
/// The drawer automatically handles navigation state and closing when an option is selected.
///
/// Example usage:
/// ```dart
/// NxCustomDrawer(
///   drawerOptions: {
///     ['Profile', Icon(Icons.person_outline)]: () {
///       // Handle profile navigation
///     },
///     ['Settings', Icon(Icons.settings_outline)]: () {
///       // Handle settings navigation
///     },
///   },
///   withSignOutOption: true,
///   signOutFunction: () {
///     // Handle sign out
///   },
///   backgroundColor: Colors.white,
///   optionTextStyle: TextStyle(fontSize: 16),
/// )
/// ```
///
/// The drawer options are specified using a map where:
/// * The key is a list containing the option text and an optional icon
/// * The value is a callback function executed when the option is tapped
class NxCustomDrawer extends StatelessWidget {
  /// Creates a custom drawer with navigation options.
  ///
  /// * [drawerOptions] - Map of navigation options and their callbacks
  /// * [padding] - Padding around drawer content (defaults to 22 all around)
  /// * [drawerHeader] - Custom header widget (defaults to "Menu" text)
  /// * [optionTextStyle] - Text style for navigation options
  /// * [withSignOutOption] - Whether to show sign out button (defaults to true)
  /// * [signOutFunction] - Callback when sign out is tapped
  /// * [signOutTextStyle] - Text style for sign out option
  /// * [signOutIcon] - Custom icon for sign out option
  /// * [sequrifyButton] - Optional branding button at bottom
  /// * [backgroundColor] - Drawer background color
  /// * [drawerWidth] - Width of the drawer
  /// * [elevation] - Drawer elevation/shadow
  const NxCustomDrawer({
    required this.drawerOptions,
    super.key,
    this.padding,
    this.drawerHeader,
    this.optionTextStyle,
    this.withSignOutOption = true,
    this.signOutFunction,
    this.signOutTextStyle,
    this.signOutIcon,
    this.sequrifyButton,
    this.backgroundColor,
    this.drawerWidth,
    this.elevation,
  });

  /// Map of navigation options and their callbacks.
  ///
  /// The key is a list where:
  /// * First element is the option text (String)
  /// * Second element (optional) is the icon widget
  ///
  /// The value is the callback function executed when the option is tapped.
  /// The drawer automatically closes before executing the callback.
  final Map<List<dynamic>, Function()> drawerOptions;

  /// Padding around the drawer content.
  ///
  /// Defaults to [EdgeInsets.all(22)] if not specified.
  final EdgeInsets? padding;

  /// Custom header widget shown at the top of the drawer.
  ///
  /// If null, displays a default header with "Menu" text in headlineMedium style.
  final DrawerHeader? drawerHeader;

  /// Text style for the navigation options.
  ///
  /// If null, uses the theme's bodyMedium style with medium weight.
  final TextStyle? optionTextStyle;

  /// Whether to show the sign out option at the bottom.
  ///
  /// When true, adds a divider and sign out button at the bottom of the drawer.
  /// Defaults to true.
  final bool withSignOutOption;

  /// Callback function executed when sign out is tapped.
  ///
  /// The drawer automatically closes before executing this callback.
  final Function()? signOutFunction;

  /// Text style for the sign out option.
  ///
  /// If null, uses the same style as regular navigation options.
  final TextStyle? signOutTextStyle;

  /// Custom icon widget for the sign out option.
  ///
  /// If null, uses the default logout icon from the package's assets.
  final Widget? signOutIcon;

  /// Optional widget shown at the bottom of the drawer.
  ///
  /// Typically used for branding or additional actions.
  /// Positioned above the sign out option if present.
  final Widget? sequrifyButton;

  /// Background color of the drawer.
  ///
  /// If null, uses the default drawer background color from the theme.
  final Color? backgroundColor;

  /// Width of the drawer.
  ///
  /// If null, uses the default drawer width.
  final double? drawerWidth;

  /// Z-coordinate at which to place the drawer relative to its parent.
  ///
  /// This controls the size of the shadow below the drawer.
  /// If null, uses the default drawer elevation.
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: backgroundColor,
      width: drawerWidth,
      elevation: elevation,
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: padding ?? const EdgeInsets.all(22),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  drawerHeader ??
                      DrawerHeader(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Menu',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ),
                      ),
                  for (final i in drawerOptions.entries)
                    buildDrawerOption(
                      context: context,
                      text: i.key[0],
                      navigateTo: i.value,
                      textStyle: optionTextStyle,
                      icon: i.key.length > 1 ? i.key[1] : null,
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: sequrifyButton,
              ),
            ),
            if (withSignOutOption)
              buildSignOutOption(
                context: context,
                signOutFunction: signOutFunction ?? () {},
                signOutTextStyle: signOutTextStyle,
                icon: signOutIcon,
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  /// Builds a single drawer option with text and optional icon.
  ///
  /// The option is rendered as a [ListTile] that closes the drawer and
  /// executes the navigation callback when tapped.
  Widget buildDrawerOption({
    required BuildContext context,
    required String text,
    required Function() navigateTo,
    TextStyle? textStyle,
    Widget? icon,
  }) {
    return ListTile(
      leading: icon,
      title: Text(
        text,
        style: textStyle ??
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
      ),
      onTap: () {
        Navigator.pop(context);
        navigateTo();
      },
    );
  }

  /// Builds the sign out option with a divider and custom styling.
  ///
  /// This creates a separated section at the bottom of the drawer
  /// specifically for the sign out functionality.
  Widget buildSignOutOption({
    required BuildContext context,
    required Function() signOutFunction,
    Widget? icon,
    TextStyle? signOutTextStyle,
  }) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        children: [
          const Divider(),
          buildDrawerOption(
            context: context,
            text: 'Sign out',
            navigateTo: signOutFunction,
            textStyle: signOutTextStyle ??
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
            icon: SvgPicture.asset(
              'assets/logout_icon.svg',
              package: 'nx_ui',
            ),
          ),
        ],
      ),
    );
  }
}
