import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class NxEmptyScreen extends StatelessWidget {
  const NxEmptyScreen({
    super.key,
    required this.context,
    required this.information,
    required this.color,
    this.icon = Ionicons.sad_outline,
    this.height,
    this.width,
  });
  final BuildContext context;
  final Text information;
  final Color color;
  final IconData? icon;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        height: height ?? MediaQuery.of(context).size.height * 0.7,
        width: width ?? MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 25,
                color: Colors.grey,
              ),
              Padding(padding: const EdgeInsets.all(20), child: information)
            ],
          ),
        ),
      );
}
