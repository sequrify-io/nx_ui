import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nx_local_notifications/nx_local_notifications.dart';
import 'package:nx_localizations/nx_localizations.dart';

import 'package:example/config.dart';
import 'package:example/generated/l10n.dart';
import 'package:example/providers/router_provider.dart';
import 'package:example/theme/theme.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    await Hive.openBox<bool>(Config.nxBox);
    await NotificationService.init();

    Isolate.current.addErrorListener(
      RawReceivePort((pair) async {
        final List<dynamic> errorAndStacktrace = pair;
      }).sendPort,
    );

    runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  }, (error, stackTrace) {});
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: Config.appTitle,
      builder: (context, child) {
        if (!kDebugMode) {
          // ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          //   return CustomError(errorDetails: errorDetails);
          // };
        }
        return child ?? Container();
      },
      // showSemanticsDebugger: true,
      theme: MaterialTheme(Theme.of(context).textTheme).light(),
      darkTheme: MaterialTheme(Theme.of(context).textTheme).dark(),
      routerConfig: router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        ...NxLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
    );
  }
}
