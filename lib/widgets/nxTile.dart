import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class nxTile extends ConsumerWidget {
  final Text? text;
  final Color? color;
  const nxTile({
    super.key,
    this.color,
    this.text,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      color: color,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), child: text),
    );
  }
}
