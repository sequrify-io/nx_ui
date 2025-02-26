import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A widget that displays a "coming soon" message with an optional icon.
///
/// This widget creates a centered column layout containing:
/// * An optional SVG icon (colored with the primary theme color)
/// * A title ("Coming Soon" by default)
/// * A descriptive message
///
/// The widget uses theme-aware styling but allows customization of text styles.
///
/// Example usage:
/// ```dart
/// NxComingSoonWidget(
///   text: 'This feature will be available in the next update',
///   comingSoonTitle: 'Coming Soon',
///   svg: SvgPicture.asset('assets/icons/rocket.svg'),
///   textStyleTitle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
///   textStyleBody: TextStyle(fontSize: 16),
/// )
/// ```
class NxComingSoonWidget extends StatelessWidget {
  /// Creates a coming soon widget.
  ///
  /// * [text] - The descriptive message to display below the title
  /// * [comingSoonTitle] - The title text (typically "Coming Soon")
  /// * [svg] - Optional SVG icon to display above the title
  /// * [textStyleTitle] - Custom style for the title
  /// * [textStyleBody] - Custom style for the message
  const NxComingSoonWidget({
    required this.text,
    required this.comingSoonTitle,
    super.key,
    this.svg,
    this.textStyleTitle,
    this.textStyleBody,
  });

  /// The SVG image to display above the title.
  ///
  /// If provided, the SVG will be colored with the theme's primary color
  /// and sized to 100x100 logical pixels.
  final SvgPicture? svg;

  /// The descriptive message displayed below the title.
  ///
  /// This text is limited to 2 lines and will be center-aligned.
  /// The text is displayed in a container with width 550 and height 60.
  final String text;

  /// The title text displayed above the message.
  ///
  /// Typically "Coming Soon" or similar placeholder text.
  final String comingSoonTitle;

  /// Custom text style for the title.
  ///
  /// If null, uses the theme's display large text style with onSurface color.
  final TextStyle? textStyleTitle;

  /// Custom text style for the message text.
  ///
  /// If null, uses the theme's body small text style with onSurface color
  /// and 1.5 line height.
  final TextStyle? textStyleBody;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (svg != null)
          SvgPicture(
            svg!.bytesLoader,
            height: 100,
            width: 100,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
        const SizedBox(height: 30),
        Text(
          comingSoonTitle,
          style: textStyleTitle ??
              Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 550,
          height: 60,
          child: Text(
            text,
            softWrap: true,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: textStyleBody ??
                Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      height: 1.5,
                    ),
          ),
        ),
      ],
    );
  }
}

/// A full-screen scaffold that displays a centered [NxComingSoonWidget].
///
/// This widget wraps [NxComingSoonWidget] in a [Scaffold] with padding and
/// proper layout constraints. Use this when you need a standalone coming soon screen
/// rather than embedding the coming soon widget in an existing layout.
///
/// Example usage:
/// ```dart
/// NxComingSoonPanel(
///   text: 'This section is under development',
///   comingSoonTitle: 'Coming Soon',
///   svg: SvgPicture.asset('assets/icons/construction.svg'),
/// )
/// ```
class NxComingSoonPanel extends StatelessWidget {
  /// Creates a full-screen coming soon panel.
  ///
  /// * [text] - The descriptive message to display
  /// * [comingSoonTitle] - The title text (typically "Coming Soon")
  /// * [svg] - Optional SVG icon to display
  /// * [textStyleTitle] - Custom style for the title
  /// * [textStyleBody] - Custom style for the message
  const NxComingSoonPanel({
    required this.text,
    required this.comingSoonTitle,
    super.key,
    this.svg,
    this.textStyleTitle,
    this.textStyleBody,
  });

  /// The SVG image to display above the title.
  ///
  /// If provided, the SVG will be colored with the theme's primary color.
  final SvgPicture? svg;

  /// The descriptive message displayed below the title.
  final String text;

  /// The title text displayed above the message.
  final String comingSoonTitle;

  /// Custom text style for the title.
  ///
  /// If null, uses the theme's display large text style.
  final TextStyle? textStyleTitle;

  /// Custom text style for the message text.
  ///
  /// If null, uses the theme's body small text style.
  final TextStyle? textStyleBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: NxComingSoonWidget(
                      svg: svg,
                      text: text,
                      comingSoonTitle: comingSoonTitle,
                      textStyleBody: textStyleBody,
                      textStyleTitle: textStyleTitle,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
