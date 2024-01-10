# nx_ui

This package provides ui widgets.

## Features

UI widgets provided in package:

- nxCustomDrawer
- nxComingSoon
- nxExpandableText
- nxPrimaryButton
- nxSecondaryButton
- nxShimmerBox
- nxSnackbar
- nxTile

## Getting started

Add the package to pubspec:

```yaml
nx_ui:
  git:
    url: https://github.com/sequrify-io/nx_ui.git
    ref: v0.0.5
```

## Usage and description of widgets

### nxCustomDrawer

Drawer widget.

<p>
<img src="images/drawer_with_sign_out.png" alt="drawer_with_sign_out" width="200"/>
<img src="images/drawer_without_sign_out.png" alt="drawer_without_sign_out" width="200"/>
</p>
Example usage:

```dart
import 'package:nx_ui/widgets/nxCustomDrawer.dart';

...
  drawer: NxCustomDrawer(
        drawerOptions: {
          'Home': () => {
                context.goNamed(
                  'home',
                  pathParameters: {
                    'tab': '0',
                  },
                ),
              },
          'Feedback': () => {
                context.goNamed(
                  'home',
                  pathParameters: {
                    'tab': '1',
                  },
                ),
              },
          'Calendar': () => {
                context.goNamed(
                  'home',
                  pathParameters: {
                    'tab': '2',
                  },
                ),
              },
        },
        withSignOutOption: false,
      ),
```

You have to provide one required parameter:
final Map<String, Function> drawerOptions - map with drawer options names as keys and navigation Functions as values.

Additionally you can provide parameters:

final EdgeInsets? padding;
final DrawerHeader? drawerHeader;
final TextStyle? optionTextStyle;
final bool withSignOutOption - default true.
final Function? signOutFunction - function invoked after clicking sign out.
final TextStyle? signOutTextStyle;

### nxComingSoon

This widget can be used as a preview of some features.
Example usage:

```dart
...
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: nxComingSoonPanel(text: 'More info available soon', comingSoonTitle: 'Coming soon'),
    );
  }

```

<img src="images/nxComingSoon.png" alt="nxComingSoon" width="200"/>

You have to provide two required parameters:

- required String text - lower text visible on screen
- required String comingSoonTitle - upper text visible on screen

The other parameters you can provide are:

- SvgPicture? svg - svg visible above title text
- TextStyle? textStyleTitle - text style of title text
- TextStyle? textStyleBody - text style of lower text

### nxExpandableText

This widget can be used when you have a long text and you want to have an option to show dialog to display whole text on scrollable.
Example usage:

```dart
...
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            nxExpandableText(text: 'hellesdfdsfdsfsdffdsdddddddjvfjfdvhfbdjdnfvcdskvjidusbvhdskfncjbdfvdnvkdsmcksdmckdmscjdnvsdvnidsjvdsmkbkmcksmdcjdsbfcdkcmdsjustynadn dsjnfsocmskdfo', buttonText: 'Read more')
          ],
        ),
      ),
    );
  }

```

<p float="left">
<img src="images/nxExpandableText1.png" alt="nxComingSoon" width="200"/>
<img src="images/nxExpandableText2.png" alt="nxComingSoon" width="200"/>
</p>

You have to provide to widget two required parameters:

- required String text - text visible on screen
- required String buttonText - text that invokes dialog after tapping

The other parameters you can provide are:

- Image? icon - your own icon used for closing the dialog that would replace the default icon
- TextStyle? dialogTextStyle - text style inside dialog
- TextStyle? textStyle - text style of text on screen
- TextStyle? buttonTextStyle - text style of button text on screen
- Color? backgroundColor - background color of dialog
- int maxLines - by default it is set to 1, number of lines that can be visible on screen

### nxPrimaryButton

This widget can be used as a button.
Example usage:

```dart
...
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            nxPrimaryButton(onPressed: () {}, labelText: 'Button')
          ],
        ),
      ),
    );
  }

```

<img src="images/nxPrimaryButton.png" alt="nxPrimaryButton" width="200"/>

You have to provide to widget two required parameters:

- required void Function() onPressed - function that will be invoked after clicking the button
- required String labelText - text displayed on button

The other parameters you can provide are:

- dynamic Function(bool)? onHighlightChanged
- MouseCursor? mouseCursor
- ButtonTextTheme? textTheme
- Color? disabledTextColor
- Color? disabledColor
- Color? focusColor
- Color? hoverColor
- Color? highlightColor
- Color? splashColor
- Brightness? colorBrightness
- double? elevation
- double? focusElevation
- double? hoverElevation
- double? highlightElevation
- double? disabledElevation
- EdgeInsetsGeometry? padding
- VisualDensity? visualDensity
- ShapeBorder? shape
- FocusNode? focusNode
- MaterialTapTargetSize? materialTapTargetSize
- Duration? animationDuration
- double? minWidth
- double? height
- void Function()? onLongPress
- Image? image - image that can replaced white arrow icon
- Color? textColor
- TextStyle? textStyle
- bool? imageEnabled - by default set to true. Set to false if you don't want to display image on button;
- Color? imageColor;

The button is based on MaterialButton, so those are all parameters that MaterialButton takes.

### nxSecondaryButton

This widget can be used as a button. This button has a gradient inside.
Example usage:

```dart
...
 @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            nxSecondaryButton(
              onPressed: () {},
              labelText: 'Button',
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }

```

<img src="images/nxSecondaryButton.png" alt="nxSecondaryButton" width="200"/>

You have to provide to widget two required parameters:

- required void Function() onPressed - function that will be invoked after clicking the button
- required String labelText - text displayed on button

The other parameters you can provide are:

- dynamic Function(bool)? onHighlightChanged
- MouseCursor? mouseCursor
- ButtonTextTheme? textTheme
- Color? disabledTextColor
- Color? disabledColor
- Color? focusColor
- Color? hoverColor
- Color? highlightColor
- Color? splashColor
- Brightness? colorBrightness
- double? elevation
- double? focusElevation
- double? hoverElevation
- double? highlightElevation
- double? disabledElevation
- EdgeInsetsGeometry? padding
- VisualDensity? visualDensity
- ShapeBorder? shape
- FocusNode? focusNode
- MaterialTapTargetSize? materialTapTargetSize
- Duration? animationDuration
- double? minWidth
- double? height
- void Function()? onLongPress
- Image? image - image that can replaced white arrow icon
- LinearGradient? linearGradient - custom gradient instead of a default one.
- Color? textColor
- TextStyle? textStyle
- bool? imageEnabled - by default set to true. Set to false if you don't want to display image on button;
- Color? imageColor;

### nxShimmerBox

This widget provides a shimmer animation and it can be displayed during loading.

Example usage:

```dart
...
 @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(body: nxShimmerBox());
  }

```

<img src="images/nxShimmerBox.png" alt="nxShimmerBox" width="200"/>

Parameters you can provide are:

- double width - width of container with shimmer, by default infinity
- double height - height of container with shimmer, by default infinity
- double opacity - opacity of shimmer, by default 1
- Color? color - color of shimmer

### nxSnackbar

This widget provides a custom snackbar. There are several types of snackbar:

- success
- error
- info
- inProgress

Each type has defined color and icon, but you can also customize it.

Example usage:

```dart
...
 @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            nxSnackbar(message: 'Success', type: SnackbarType.success, width: 200),
            nxSnackbar(message: 'Error', type: SnackbarType.error, width: 200, colorError: Colors.redAccent),
            nxSnackbar(message: 'Info', type: SnackbarType.info, width: 200),
            nxSnackbar(message: 'In Progress', type: SnackbarType.inProgress, width: 200)
          ],
        ),
      ),
    );
  }

```

<img src="images/nxSnackbar.png" alt="nxSnackbar" width="200"/>

You have to provide to widget three required parameters:

- required String message - text that appears on snackbar
- required SnackbarType type - type of snackbar. You can choose from: SnackbarType.success, SnackbarType.error, SnackbarType.info, SnackbarType.inProgress
- required double width

Parameters you can provide to widget:

- Color? colorSuccess
- Color? colorError
- Color? colorInfo
- Color? colorInProgress
- Image? assetImageSuccess
- Image? assetImageFailure
- Image? assetImageInProgress
- Image? assetImageInfo
- TextStyle? textStyle
- double? height

### nxTile

This widget provides a tile component.
Example usage:

```dart
...
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            nxTile(
              color: Colors.black,
              text: Text(
                'Hello',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

```

<img src="images/nxTile.png" alt="nxTile" width="200"/>

The tile's measurments adjust along with added text.

Parameters you can provide:

- Color? color - color of a tile, default is white
- Text? text - Text widget inside a tile

## Bugs & features

If you found bug or need a feature add issue on Github or make a PR.
