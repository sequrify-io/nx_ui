import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class nxExpandableText extends StatelessWidget {
  final String text;
  final String buttonText;
  final int maxLines;
  final Image? icon;
  final TextStyle? dialogTextStyle;
  final TextStyle? textStyle;
  final TextStyle? buttonTextStyle;
  final Color? backgroundColor;

  const nxExpandableText({
    super.key,
    required this.text,
    required this.buttonText,
    this.icon,
    this.dialogTextStyle,
    this.textStyle,
    this.buttonTextStyle,
    this.backgroundColor,
    this.maxLines = 1,
  });

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
              Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
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
                  Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
            ),
          ),
      ],
    );
  }
}

class TextDialog extends ConsumerWidget {
  const TextDialog({super.key, required this.text, this.icon, this.dialogTextStyle, this.backgroundColor});

  final String text;
  final Image? icon;
  final TextStyle? dialogTextStyle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: icon ??
                  const Image(
                    image: AssetImage('assets/button-close@2x.png', package: 'nx_ui'),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(60.0),
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
                                  color: Theme.of(context).colorScheme.onBackground,
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
