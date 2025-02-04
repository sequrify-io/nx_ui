import 'package:flutter/material.dart';

import 'package:nx_ui/models/destination.dart';

class NxCustomNavigationDrawer extends StatelessWidget {
  const NxCustomNavigationDrawer({
    required this.destinations, super.key,
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
  final Function(int)? onDestinationSelected;
  final int? selectedIndex;
  final List<Destination> destinations;
  final Destination? signOutDestination;
  final TextStyle? headerTextStyle;
  final TextStyle? optionTextStyle;
  final Widget? sequrifyButton;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Color? indicatorColor;
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
