import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ionicons/ionicons.dart';

/// A widget that displays truncated text with an option to expand it in a dialog.
///
/// This widget shows text that is truncated to a specified number of lines,
/// with a button that opens a dialog showing the full text. The dialog is
/// scrollable and allows text selection.
///
/// Features:
/// * Customizable text truncation
/// * Expandable dialog with scroll support
/// * Selectable text in dialog
/// * Customizable styling for text and button
/// * Customizable close icon support
///
/// Example usage:
/// ```dart
/// NxExpandableText(
///   text: 'This is a long text that will be truncated...',
///   buttonText: 'Read more',
///   maxLines: 2,
///   textStyle: TextStyle(fontSize: 16),
///   buttonTextStyle: TextStyle(color: Colors.blue),
///   backgroundColor: Colors.white,
/// )
/// ```
class NxExpandableText extends StatelessWidget {
  /// Creates an expandable text widget.
  ///
  /// * [text] - The text to display and expand
  /// * [buttonText] - Text for the expand button
  /// * [maxLines] - Number of lines to show before truncating
  /// * [icon] - Custom close icon for the dialog
  /// * [dialogTextStyle] - Text style in the dialog
  /// * [textStyle] - Text style for the truncated text
  /// * [buttonTextStyle] - Text style for the expand button
  /// * [backgroundColor] - Background color of the dialog
  const NxExpandableText({
    required this.text,
    required this.buttonText,
    super.key,
    this.icon,
    this.dialogTextStyle,
    this.textStyle,
    this.buttonTextStyle,
    this.backgroundColor,
    this.maxLines = 1,
  });

  /// The text to display and expand.
  ///
  /// This text will be truncated in the main view and shown in full
  /// when expanded in the dialog.
  final String text;

  /// The text to display on the expand button.
  ///
  /// Typically "Read more", "Show more", or similar call-to-action text.
  final String buttonText;

  /// Number of lines to show before truncating the text.
  ///
  /// If set to 0, the button will not be shown.
  /// Defaults to 1.
  final int maxLines;

  /// Custom close icon for the dialog.
  ///
  /// If null, uses [Ionicons.close_outline].
  final Image? icon;

  /// Text style for the text when shown in the dialog.
  ///
  /// If null, uses the theme's titleLarge style in black.
  final TextStyle? dialogTextStyle;

  /// Text style for the truncated text.
  ///
  /// If null, uses the theme's bodyMedium style in black.
  final TextStyle? textStyle;

  /// Text style for the expand button.
  ///
  /// If null, uses the theme's bodyMedium style in black.
  final TextStyle? buttonTextStyle;

  /// Background color of the dialog.
  ///
  /// If null, uses the default dialog background color.
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

/// A dialog that displays the full text with a close button.
///
/// This dialog is used internally by [NxExpandableText] to show the complete
/// text content. It provides:
/// * Scrollable content area
/// * Selectable text
/// * Close button with custom icon support
/// * Maximum height constraint with scroll
/// * Customizable styling
class TextDialog extends ConsumerWidget {
  /// Creates a text dialog.
  ///
  /// * [text] - The full text to display
  /// * [icon] - Custom close icon (defaults to close outline)
  /// * [dialogTextStyle] - Style for the displayed text
  /// * [backgroundColor] - Dialog background color
  const TextDialog({
    required this.text,
    super.key,
    this.icon,
    this.dialogTextStyle,
    this.backgroundColor,
  });

  /// The text to display in the dialog.
  ///
  /// This text will be selectable and centered in the dialog.
  final String text;

  /// Custom close icon for the dialog.
  ///
  /// If null, uses [Ionicons.close_outline].
  final Image? icon;

  /// Text style for the displayed text.
  ///
  /// If null, uses the theme's titleLarge style in black.
  final TextStyle? dialogTextStyle;

  /// Background color of the dialog.
  ///
  /// If null, uses the default dialog background color.
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
