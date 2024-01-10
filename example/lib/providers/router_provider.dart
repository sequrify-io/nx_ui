import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:example/interface/main.dart';
import 'package:example/loggers.dart';

class Routes {
  static const initial = '/';
  static const auth = '/auth';
  static const userSetup = '/user_setup';
  static const settings = '/settings';
  static const home = '/home';

  static build(String route, List<String> params) => [route, ...params].join('/');
}

final navigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  routerLogger.printStart();

  return GoRouter(
    navigatorKey: navigatorKey,
    // debugLogDiagnostics: true,
    initialLocation: '/home/${0}',
    routes: [
      GoRoute(
        name: 'home',
        path: '${Routes.home}/:tab',
        builder: (BuildContext context, GoRouterState state) => MainScreen(
          key: state.pageKey,
          currentTab: int.tryParse(state.pathParameters['tab'] ?? '') ?? 0,
        ),
      ),
    ],
  );
});

/// Helper for creating simple route.
GoRoute buildRoute(String path, Widget screen) => GoRoute(
      path: path,
      builder: (BuildContext context, GoRouterState state) => screen,
    );
