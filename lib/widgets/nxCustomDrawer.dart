import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NxCustomDrawer extends StatelessWidget {
  const NxCustomDrawer({
    super.key,
    required this.drawerOptions,
    this.padding,
    this.drawerHeader,
    this.optionTextStyle,
    this.withSignOutOption = true,
    this.signOutFunction,
    this.signOutTextStyle,
    this.signOutIcon,
    this.sequrifyButton,
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: padding ?? const EdgeInsets.all(22),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  drawerHeader ??
                      const DrawerHeader(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Menu',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
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
            if (withSignOutOption) buildSignOutOption(context: context, signOutFunction: signOutFunction ?? () {}, signOutTextStyle: signOutTextStyle, icon: signOutIcon) else const SizedBox.shrink(),
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
            const TextStyle(
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              color: Color(0xFF49454F),
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
          Divider(
            color: Colors.black.withOpacity(0.1),
            thickness: 1.5,
          ),
          buildDrawerOption(
            context: context,
            text: 'Sign out',
            navigateTo: signOutFunction,
            textStyle: signOutTextStyle ??
                const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF49454F),
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
