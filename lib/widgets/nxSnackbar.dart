import 'package:flutter/material.dart';

class nxSnackbar extends StatelessWidget {
  final String message;
  final SnackbarType type;
  final double width;
  final double? height;
  final Color? colorSuccess;
  final Color? colorError;
  final Color? colorInProgress;
  final Color? colorInfo;
  final Image? assetImageSuccess;
  final Image? assetImageFailure;
  final Image? assetImageInProgress;
  final Image? assetImageInfo;
  final TextStyle? textStyle;

  const nxSnackbar({
    super.key,
    required this.message,
    required this.type,
    required this.width,
    this.colorSuccess,
    this.colorError,
    this.colorInfo,
    this.colorInProgress,
    this.assetImageSuccess,
    this.assetImageFailure,
    this.assetImageInProgress,
    this.assetImageInfo,
    this.textStyle,
    this.height,
  });

  Color _getBackgroundColor(BuildContext context) {
    switch (type) {
      case SnackbarType.success:
        return colorSuccess ?? Colors.green;
      case SnackbarType.error:
        return colorError ?? Colors.red;
      case SnackbarType.inProgress:
        return colorInProgress ?? Colors.blue;
      case SnackbarType.info:
        return colorInfo ?? Colors.grey;
    }
  }

  Image _getImage() {
    switch (type) {
      case SnackbarType.success:
        return assetImageSuccess ??
            const Image(
              image: AssetImage('assets/icon-big-ok.png', package: 'nx_ui'),
            );
      case SnackbarType.error:
        return assetImageFailure ??
            const Image(
              image: AssetImage('assets/icon-big-failed.png', package: 'nx_ui'),
            );
      case SnackbarType.inProgress:
        return assetImageInProgress ??
            const Image(
              image: AssetImage('assets/icon-big-failed.png', package: 'nx_ui'),
            );
      case SnackbarType.info:
        return assetImageInfo ??
            const Image(
              image: AssetImage('assets/icon-info.png', package: 'nx_ui'),
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 70.0,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: _getBackgroundColor(context)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15.0, right: 20, bottom: 15),
            child: SizedBox(width: 40, height: 40, child: _getImage()),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  message,
                  style: textStyle ?? TextStyle(color: Theme.of(context).colorScheme.scrim, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum SnackbarType { success, error, inProgress, info }
