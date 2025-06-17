import 'package:flutter_fundamentals_app/core/theme/theme_fundamentals.dart';
import 'package:flutter/material.dart';

final class ThemeFundamentalsWrap {
  ThemeFundamentalsWrap._({required this.themeData});
  final ThemeFundamentalsData themeData;

  factory ThemeFundamentalsWrap.on({required BuildContext context}) {
    final mode = ThemeMode.system;
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final useDarkTheme =
        mode == ThemeMode.dark || platformBrightness == Brightness.dark;
    final highContrast = MediaQuery.highContrastOf(context);

    ThemeFundamentalsData? theme;
    if (useDarkTheme && highContrast) {
      theme = ThemeFundamentalsData.darkHighContrast();
    } else if (useDarkTheme) {
      theme = ThemeFundamentalsData.dark();
    } else if (highContrast) {
      theme = ThemeFundamentalsData.lightHighContrast();
    }
    return ThemeFundamentalsWrap._(
      themeData: theme ?? ThemeFundamentalsData.light(),
    );
  }
}
