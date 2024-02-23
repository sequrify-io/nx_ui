import 'package:example/interface/notification_details_screen.dart';
import 'package:example/interface/notification_screen.dart';
import 'package:example/repositories/notification_repository/models/notification_model.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:example/interface/main.dart';
import 'package:example/loggers.dart';
import 'package:nx_local_notifications/nx_local_notifications.dart';

class Routes {
  static const initial = '/';
  static const auth = '/auth';
  static const notifications = '/notifications';
  static const notificationDetails = '/notification_details';
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
      GoRoute(
        name: 'notifications',
        path: Routes.notifications,
        builder: (BuildContext context, GoRouterState state) => NotificationScreen(
          arguments: state.extra! as NotificationScreenArgs<NotificationEntry>,
        ),
      ),
      GoRoute(
        name: 'notification_details',
        path: Routes.notificationDetails,
        builder: (BuildContext context, GoRouterState state) => NotificationDetailsScreen(
          notification: state.extra! as NotificationEntry,
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
