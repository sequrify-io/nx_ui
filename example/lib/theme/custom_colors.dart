import 'package:flutter/material.dart';

CustomColors lightCustomColors = const CustomColors(
  successColor: Colors.green,
  calendarSemiColor: Colors.yellow,
);

CustomColors darkCustomColors = const CustomColors(
  successColor: Color(0xff6DFA72),
  calendarSemiColor: Color(0xffFCEC54),
);

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.successColor,
    required this.calendarSemiColor,
  });

  final Color? successColor;
  final Color? calendarSemiColor;

  @override
  CustomColors copyWith({
    Color? successColor,
    Color? calendarSemiColor,
  }) {
    return CustomColors(
      successColor: successColor ?? this.successColor,
      calendarSemiColor: calendarSemiColor ?? this.calendarSemiColor,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      successColor: Color.lerp(successColor, other.successColor, t),
      calendarSemiColor: Color.lerp(calendarSemiColor, other.calendarSemiColor, t),
    );
  }

  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith();
  }
}
