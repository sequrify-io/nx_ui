import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

class NxExpandableText extends StatelessWidget {
  const NxExpandableText({
    required this.text, required this.buttonText, super.key,
    this.icon,
    this.dialogTextStyle,
    this.textStyle,
    this.buttonTextStyle,
    this.backgroundColor,
    this.maxLines = 1,
  });

  final String text;
  final String buttonText;
  final int maxLines;
  final Image? icon;
  final TextStyle? dialogTextStyle;
  final TextStyle? textStyle;
  final TextStyle? buttonTextStyle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    void showFullTextDialog(String text) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return TextDialog(
            text: text,
            icon: icon,
            backgroundColor: backgroundColor,
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: textStyle ??
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                  ),
        ),
        if (maxLines > 0)
          TextButton(
            onPressed: () {
              showFullTextDialog(text);
            },
            child: Text(
              buttonText,
              style: buttonTextStyle ??
                  Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                      ),
            ),
          ),
      ],
    );
  }
}

class TextDialog extends ConsumerWidget {
  const TextDialog({
    required this.text, super.key,
    this.icon,
    this.dialogTextStyle,
    this.backgroundColor,
  });

  final String text;
  final Image? icon;
  final TextStyle? dialogTextStyle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: icon ?? const Icon(Ionicons.close_outline),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(60),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 200),
              width: 450,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: SelectableText(
                        text,
                        style: dialogTextStyle ??
                            Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Colors.black,
                                ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
