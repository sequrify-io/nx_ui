import 'package:flutter/material.dart';

class Destination {
  const Destination(
    this.label,
    this.icon,
    this.selectedIcon,
  );

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}
