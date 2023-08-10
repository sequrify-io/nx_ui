import 'package:flutter/material.dart';

class Config {
  /// App title used in [MaterialApp]; Is passed to [WidgetsApp.title].
  static const appTitle = 'Nextapps app';

  /// When deep linking is configured, this prefix should be used in every navigation link that should be opened in a native app.
  static const deepLinkPrefix = 'nextapps://nextapps.co';
  // TODO design a system to manage api url. Variable, .env, ENV?
  static const apiUrl = 'https://app.nextapps.co';

  // Hive box names
  static const nxBox = '__NXBOX__';
  static const passwordlessLoginBox = 'passwordlessLogin';
  static const userSettingsBox = 'userSettings';
}
