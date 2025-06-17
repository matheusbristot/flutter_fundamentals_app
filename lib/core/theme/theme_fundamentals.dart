import 'package:flutter/material.dart';
import 'package:flutter_fundamentals_app/core/theme/colors_fundamentals.dart';
import 'package:flutter_fundamentals_app/core/theme/typography_fundamentals.dart';

class ThemeFundamentals extends InheritedWidget {
  final ThemeFundamentalsData data;
  final void Function(ThemeFundamentalsData) updateTheme;

  const ThemeFundamentals({
    super.key,
    required this.data,
    required this.updateTheme,
    required super.child,
  });

  static ThemeFundamentals of(BuildContext context) {
    final ThemeFundamentals? result =
        context.dependOnInheritedWidgetOfExactType<ThemeFundamentals>();
    assert(result != null, 'No ThemeFundamentals found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeFundamentals oldWidget) =>
      data != oldWidget.data;
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
