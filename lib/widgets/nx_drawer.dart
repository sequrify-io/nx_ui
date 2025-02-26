import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NxCustomDrawer extends StatelessWidget {
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
  final Map<List<dynamic>, Function()> drawerOptions;
  final EdgeInsets? padding;
  final DrawerHeader? drawerHeader;
  final TextStyle? optionTextStyle;
  final bool withSignOutOption;
  final Function()? signOutFunction;
  final TextStyle? signOutTextStyle;
  final Widget? signOutIcon;
  final Widget? sequrifyButton;
  final Color? backgroundColor;
  final double? drawerWidth;
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
                  icon: signOutIcon)
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

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
