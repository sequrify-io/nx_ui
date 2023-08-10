import 'package:flutter/foundation.dart' hide Diagnosticable;

import 'package:diagnosticable/diagnosticable.dart';

/// Logger for all router related events
const routerLogger = Diagnosticable(
  // debugLevel: DebugLevel.debug,
  forceDebugMessages: kIsWeb,
  scope: 'goRouter',
);

/// Logger for Widget.build method to log rebuilds.
const widgetRebuildLogger = Diagnosticable(
  // debugLevel: DebugLevel.debug,
  // forceDebugMessages: kIsWeb,
  scope: 'widget',
);
