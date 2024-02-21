import 'package:example/interface/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:ionicons/ionicons.dart';

import 'package:nx_main_screen/nx_main_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:nx_sequrify/nx_sequrify.dart';
import 'package:nx_ui/widgets/nxBackgroundLayer.dart';
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
        icon: Icon(Ionicons.person_outline),
        activeIcon: Icon(Ionicons.person),
        label: 'Profile',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Ionicons.notifications_outline),
        activeIcon: Icon(Ionicons.notifications),
        label: 'Notifications',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Ionicons.settings_outline),
        activeIcon: Icon(Ionicons.settings),
        label: 'Settings',
      ),
    ];

    return nxMainScreen(
      appContext: context,
      drawer: Stack(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Stack(
              children: [
                NxBackgroundLayer(
                  backgroundColor: Colors.black.withOpacity(0.2),
                ),
              ],
            ),
          ),
          NxCustomDrawer(
            sequrifyButton: SequrifyButton(
              onPressed: () {},
            ),
            drawerOptions: {
              [
                'Profile',
                SvgPicture.asset('assets/icons/profile_icon.svg'),
              ]: () => {
                    context.goNamed(
                      'home',
                      pathParameters: {
                        'tab': '0',
                      },
                    ),
                  },
              [
                'Notifications',
                SvgPicture.asset('assets/icons/notifications_icon.svg'),
              ]: () => {
                    context.goNamed(
                      'home',
                      pathParameters: {
                        'tab': '1',
                      },
                    ),
                  },
              [
                'Settings',
                SvgPicture.asset('assets/icons/settings_icon.svg'),
              ]: () => {
                    context.goNamed(
                      'home',
                      pathParameters: {
                        'tab': '2',
                      },
                    ),
                  },
            },
          ),
        ],
      ),
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
      bottomNavUnselectedItemColor: Color(0xFF625B71),
      bottomNavSelectedItemColor: Theme.of(context).colorScheme.onPrimary,
      // bottomNavUnselectedItemColor: Theme.of(context).colorScheme.onBackground,
    );
  }
}
