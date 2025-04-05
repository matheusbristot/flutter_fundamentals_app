import "package:flutter/material.dart";
import "package:flutter_fundamentals_app/core/theme/colors_fundamentals.dart";
import "package:flutter_fundamentals_app/core/theme/typography_fundamentals.dart";
import "package:provider/provider.dart";

class ThemeFundamentals extends Provider<ThemeFundamentalsData> {
  ThemeFundamentals({
    super.key,
    required ThemeFundamentalsData data,
    required Widget child,
  }) : super.value(
          value: data,
          child: child,
        );

  static ThemeFundamentalsData of(BuildContext context, {bool listen = true}) {
    try {
      return Provider.of<ThemeFundamentalsData>(context, listen: listen);
    } on ProviderNotFoundException {
      return ThemeFundamentalsData.light();
    }
  }
}

@immutable
final class ThemeFundamentalsData {
  const ThemeFundamentalsData(this.themeData);

  factory ThemeFundamentalsData.light() =>
      ThemeFundamentalsData(_theme(ColorsFundamentals.lightScheme()));

  factory ThemeFundamentalsData.dark() =>
      ThemeFundamentalsData(_theme(ColorsFundamentals.darkScheme()));

  factory ThemeFundamentalsData.darkHighContrast() => ThemeFundamentalsData(
        _theme(ColorsFundamentals.darkHighContrastScheme()),
      );

  factory ThemeFundamentalsData.lightHighContrast() => ThemeFundamentalsData(
        _theme(ColorsFundamentals.lightHighContrastScheme()),
      );

  static ThemeData _theme(ColorScheme colorScheme) => ThemeData(
        fontFamily: 'SpaceGrotesk',
        useMaterial3: true,
        brightness: colorScheme.brightness,
        primaryColor: colorScheme.primary,
        colorScheme: colorScheme,
        textTheme: TypographyFundamentals(colorScheme).apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        dividerTheme: DividerThemeData(
          color: colorScheme.secondaryFixed,
          thickness: 1.0,
          space: 0,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: colorScheme.primary,
        ),
      );

  List<ExtendedColor> get extendedColors => [];
  final ThemeData themeData;
}
