import 'package:flutter/material.dart';

class NxCustomDrawer extends StatelessWidget {
  const NxCustomDrawer({super.key, required this.drawerOptions, this.padding, this.drawerHeader, this.optionTextStyle, this.withSignOutOption = true, this.signOutFunction, this.signOutTextStyle});
  final Map<String, Function> drawerOptions;
  final EdgeInsets? padding;
  final DrawerHeader? drawerHeader;
  final TextStyle? optionTextStyle;
  final bool withSignOutOption;
  final Function? signOutFunction;
  final TextStyle? signOutTextStyle;

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
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Menu',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                  for (final i in drawerOptions.entries)
                    buildDrawerOption(
                      context,
                      i.key,
                      i.value,
                      optionTextStyle,
                    ),
                ],
              ),
            ),
            if (withSignOutOption) buildSignOutOption(context: context, signOutFunction: signOutFunction ?? () {}, signOutTextStyle: signOutTextStyle) else const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerOption(
    BuildContext context,
    String text,
    Function navigateTo,
    TextStyle? textStyle,
  ) {
    return ListTile(
      title: Text(
        text,
        style: textStyle ??
            const TextStyle(
              fontSize: 16,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
              color: Colors.grey,
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
    required Function signOutFunction,
    TextStyle? signOutTextStyle,
  }) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        children: [
          const Divider(color: Colors.grey, thickness: 1.5),
          buildDrawerOption(
            context,
            'Sign out',
            signOutFunction,
            signOutTextStyle ??
                const TextStyle(
                  fontSize: 16,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
