import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NxComingSoonWidget extends StatelessWidget {
  const NxComingSoonWidget({
    required this.text,
    required this.comingSoonTitle,
    super.key,
    this.svg,
    this.textStyleTitle,
    this.textStyleBody,
  });

  final SvgPicture? svg;
  final String text;
  final String comingSoonTitle;
  final TextStyle? textStyleTitle;
  final TextStyle? textStyleBody;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (svg != null)
          SvgPicture(
            svg!.bytesLoader,
            height: 100,
            width: 100,
            colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary, BlendMode.srcIn),
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

class NxComingSoonPanel extends StatelessWidget {
  const NxComingSoonPanel({
    required this.text,
    required this.comingSoonTitle,
    super.key,
    this.svg,
    this.textStyleTitle,
    this.textStyleBody,
  });

  final SvgPicture? svg;
  final String text;
  final String comingSoonTitle;
  final TextStyle? textStyleTitle;
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
