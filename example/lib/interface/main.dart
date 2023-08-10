import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:example/generated/l10n.dart';
import 'package:example/theme/custom_colors.dart';
import 'package:example/utils/theme_utils.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        color: themeExtension<CustomColors>(context).calendarSemiColor,
        child: Center(
          child: Text(AppLocalizations.of(context).app_title),
        ),
      ),
    );
  }
}
