import 'package:flutter/material.dart';
import 'package:example/theme/custom_colors.dart';
import 'package:example/theme/text_theme.dart';

final lightScheme = const ColorScheme.light().copyWith(
  // App background
  background: Colors.white,
  // Text directly on the background-(Appbar-Titles,CircularProgressIndicator)
  onBackground: const Color(0xff263F7B),
  // color of card background-(Calendar-Date Cards,Pin-numpad,Message-MessageCard sentByUser)
  surface: const Color(0xffbad6f2),
  surfaceVariant: const Color(0xfffecdf3),
  surfaceTint: const Color(0xffdce4f0),
  // color  card text(Calendar-Date Cards,Pin-numpad,Message-MessageCard sentByUser)
  onSurface: const Color(0xff333333),
  onSurfaceVariant: const Color(0xff535252),
  // selected items - (Back Buttons,Icon buttons,Icons)
  primary: const Color(0xff263F7B),
  onPrimary: const Color(0xffdddddd),
  // selected card, item - (Message-MessageCard)
  primaryContainer: const Color(0xff304983),
  onPrimaryContainer: const Color(0xffcccccc),
  //An accent color used for less prominent components in the UI- (Drawer-Menu,Check Icon,Edit Button-Bottom Navigator Selected Button)
  secondary: const Color(0xffCD2177),
  onSecondary: const Color(0xfff3f0dd),
  secondaryContainer: const Color(0xffd33483),
  onSecondaryContainer: const Color(0xfff4f2e5),
  // Inputs-Textfield cursorColor
  tertiary: const Color(0xff21d7f3),
  onTertiary: const Color(0xffd4fbff),
  tertiaryContainer: const Color(0xff54e3f9),
  onTertiaryContainer: const Color(0xffdcf7fa),
  // borders
  // must be 3 contrast with surface-OutlineInputBorder border -BoxDecoration border
  outline: const Color(0xff999999),
  // decorative outline elements color-Divider
  outlineVariant: const Color(0xffc9c9c9),
  shadow: const Color(0xff263F7B).withOpacity(0.9),
  scrim: const Color(0xffBCCFFC),
  error: const Color(0xffD90C35),
  onError: const Color(0xfffff1f3),
  errorContainer: const Color(0xffDE9197),
  onErrorContainer: const Color(0xfffff1f3),
);

final darkScheme = const ColorScheme.dark().copyWith(
  // App background
  background: const Color(0xff2c2c2c),
  // Text directly on the background-(Appbar-Titles,CircularProgressIndicator)
  onBackground: const Color(0xffd8d9d9),
  // color of card background-(Calendar-Date Cards,Pin-numpad,Message-MessageCard sentByUser)
  surface: const Color(0xff193880),
  surfaceVariant: const Color(0xff911375),
  surfaceTint: const Color(0xffb9bfc8),
  // color  card text(Calendar-Date Cards,Pin-numpad,Message-MessageCard sentByUser)
  onSurface: const Color(0xffd1d1d1),
  onSurfaceVariant: const Color(0xffeae8e8),
  // selected items - (Back Buttons,Icon buttons,Icons)
  primary: const Color(0xff4978e3),
  onPrimary: const Color(0xffdddddd),
  // selected card, item - (Message-MessageCard)
  primaryContainer: const Color(0xff5987f2),
  onPrimaryContainer: const Color(0xff4e4e4e),
  //An accent color used for less prominent components in the UI- (Drawer-Menu,Check Icon,Edit Button-Bottom Navigator Selected Button)
  secondary: const Color(0xffd43c88),
  onSecondary: const Color(0xfff3f0dd),
  secondaryContainer: const Color(0xffd95d9b),
  onSecondaryContainer: const Color(0xfff4f2e5),
  // Inputs-Textfield cursorColor
  tertiary: const Color(0xff278f9f),
  onTertiary: const Color(0xffd4fbff),
  tertiaryContainer: const Color(0xff419aa8),
  onTertiaryContainer: const Color(0xffdcf7fa),
// borders
  // must be 3 contrast with surface-OutlineInputBorder border -BoxDecoration border
  outline: const Color(0xff999999),
  // decorative outline elements color-Divider
  outlineVariant: const Color(0xffc9c9c9),
  shadow: const Color(0xff4b5b83).withOpacity(0.9),
  scrim: const Color(0xffBCCFFC),

  error: const Color(0xffae0829),
  onError: const Color(0xfffff1f3),
  errorContainer: const Color(0xff9e2f38),
  onErrorContainer: const Color(0xfffff1f3),
);

ThemeData lightAppTheme = ThemeData(
  colorScheme: lightScheme,
  textTheme: lightTextTheme,
  extensions: [lightCustomColors.harmonized(lightScheme)],
);

ThemeData darkAppTheme = ThemeData(
  colorScheme: darkScheme,
  textTheme: darkTextTheme,
  extensions: [darkCustomColors.harmonized(darkScheme)],
);
