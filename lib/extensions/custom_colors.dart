import 'package:flutter/material.dart';

class CustomColors {
  final BuildContext _context;
  const CustomColors.of(BuildContext context) : _context = context;

  Color get primary => Theme.of(_context).extension<CustomColorScheme>()!.primary!;
  Color get secondary => Theme.of(_context).extension<CustomColorScheme>()!.secondary!;
  Color get backgroundColor => Theme.of(_context).extension<CustomColorScheme>()!.backgroundColor!;
  Color get errorColor => Theme.of(_context).extension<CustomColorScheme>()!.errorColor!;
  Color get primaryText => Theme.of(_context).extension<CustomColorScheme>()!.primaryText!;
  Color get borderColor => Theme.of(_context).extension<CustomColorScheme>()!.borderColor!;
}

@immutable
class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  final Color? primary;
  final Color? secondary;
  final Color? backgroundColor;
  final Color? errorColor;
  final Color? primaryText;
  final Color? borderColor;

  const CustomColorScheme({
    required this.primary,
    required this.secondary,
    required this.backgroundColor,
    required this.errorColor,
    required this.primaryText,
    required this.borderColor,
  });

  const CustomColorScheme.classic({
    this.primary = const Color(0xffca7e44),
    this.secondary = const Color(0xfff0d6c3),
    this.backgroundColor = const Color(0xffecddcd),
    this.errorColor = const Color(0xffd70000),
    this.primaryText = const Color(0xff66482e),
    this.borderColor = const Color(0xff6D3036),
  });

  @override
  ThemeExtension<CustomColorScheme> copyWith({
    Color? primary,
    Color? secondary,
    Color? errorColor,
    Color? backgroundColor,
    Color? primaryText,
    Color? borderColor,
  }) {
    return CustomColorScheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      errorColor: errorColor ?? this.errorColor,
      primaryText: primaryText ?? this.primaryText,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  ThemeExtension<CustomColorScheme> lerp(ThemeExtension<CustomColorScheme>? other, double t) {
    if (other is! CustomColorScheme) {
      return this;
    }
    return CustomColorScheme(
      primary: Color.lerp(primary, other.primary, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      errorColor: Color.lerp(errorColor, other.errorColor, t),
      primaryText: Color.lerp(primaryText, other.primaryText, t),
      borderColor: Color.lerp(borderColor, other.borderColor, t),
    );
  }
}
