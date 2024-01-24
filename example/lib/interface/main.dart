import 'package:example/interface/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ionicons/ionicons.dart';

import 'package:nx_main_screen/nx_main_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:nx_ui/widgets/nxBackgroundImage.dart';
import 'package:nx_ui/widgets/nxCustomDrawer.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({required this.currentTab, super.key});
  final int currentTab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pages = <Widget>[
      const HomeScreen(),
      Container(),
      Container(),
    ];

    final items = [
      const BottomNavigationBarItem(
        icon: Icon(Ionicons.home_outline),
        activeIcon: Icon(Ionicons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Ionicons.people_outline),
        activeIcon: Icon(Ionicons.people),
        label: 'Feedback',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Ionicons.calendar),
        activeIcon: Icon(Ionicons.calendar),
        label: 'Calendar',
      ),
    ];

    return nxMainScreen(
      appContext: context,
      drawer: Stack(children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: const Stack(
            children: [
              NxBackgroundImage(
                imagePath: "assets/images/nextapps_logo_background.png",
                imageShift: 0,
                opacity: 0.5,
              ),
            ],
          ),
        ),
        NxCustomDrawer(
          drawerOptions: {
            'Home': () => {
                  context.goNamed(
                    'home',
                    pathParameters: {
                      'tab': '0',
                    },
                  ),
                },
            'Feedback': () => {
                  context.goNamed(
                    'home',
                    pathParameters: {
                      'tab': '1',
                    },
                  ),
                },
            'Calendar': () => {
                  context.goNamed(
                    'home',
                    pathParameters: {
                      'tab': '2',
                    },
                  ),
                },
          },
        ),
      ]),
      currentTab: currentTab,
      onTabChange: (int index) {
        context.goNamed(
          'home',
          pathParameters: {
            'tab': '$index',
          },
        );
      },
      pages: pages,
      items: items,
      bottomNavSelectedItemColor: Theme.of(context).colorScheme.onPrimary,
      // bottomNavUnselectedItemColor: Theme.of(context).colorScheme.onBackground,
    );
  }
}
