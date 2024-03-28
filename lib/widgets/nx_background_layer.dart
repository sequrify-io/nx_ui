import 'package:flutter/material.dart';

class NxBackgroundLayer extends StatelessWidget {
  const NxBackgroundLayer({
    this.fromAssets = true,
    this.backgroundColor,
    this.imagePath,
    this.imageShift = 0.0,
    this.imageOpacity = 1,
    super.key,
  });
  final bool fromAssets;
  final Color? backgroundColor;
  final String? imagePath;
  final double imageShift;
  final double imageOpacity;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: imageShift,
      child: fromAssets != true && imagePath != null
          ? Image.network(
              imagePath!,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            )
          : Container(
              color: backgroundColor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: fromAssets == true && imagePath != null
                  ? BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath!),
                        fit: BoxFit.fitWidth,
                        opacity: imageOpacity,
                      ),
                    )
                  : null,
            ),
    );
  }
}
