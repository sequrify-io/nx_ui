import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:example/generated/l10n.dart';
import 'package:example/theme/custom_colors.dart';
import 'package:example/utils/theme_utils.dart';
import 'package:nx_ui/nx_ui.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            nxTile(
              color: Colors.black,
              text: Text(
                'Hello',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
