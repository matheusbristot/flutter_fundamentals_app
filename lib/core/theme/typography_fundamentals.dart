import 'package:flutter/material.dart';

@immutable
final class TypographyFundamentals extends TextTheme {
  static const fontFamily = 'SpaceGrotesk';

  TypographyFundamentals(ColorScheme colorScheme)
      : super(
          displayLarge: TextStyle(
            fontFamily: fontFamily,
            color: colorScheme.onPrimary,
            fontSize: 57,
            height: 64 / 57, // line-height: 64px
            letterSpacing: -0.25,
            fontWeight: FontWeight.w400,
          ),
          displayMedium: TextStyle(
            fontFamily: fontFamily,
            color: colorScheme.onPrimary,
            fontSize: 45,
            height: 52 / 45,
            letterSpacing: 0,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: TextStyle(
            fontFamily: fontFamily,
            color: colorScheme.onPrimary,
            fontSize: 28,
            height: 36 / 28,
            letterSpacing: 0,
            fontWeight: FontWeight.w500, // Medium
          ),
          titleLarge: TextStyle(
            fontFamily: fontFamily,
            color: colorScheme.onPrimary,
            fontSize: 22,
            height: 28 / 22,
            letterSpacing: 0,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            fontFamily: fontFamily,
            color: colorScheme.onPrimary,
            fontSize: 16,
            height: 24 / 16,
            letterSpacing: 0.5 / 16, // 0.5px → 0.03125em
            fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            fontFamily: fontFamily,
            color: colorScheme.onPrimary,
            fontSize: 12,
            height: 16 / 12,
            letterSpacing: 0.4 / 12, // 0.4px → 0.033em
            fontWeight: FontWeight.w400,
          ),
          labelLarge: TextStyle(
            fontFamily: fontFamily,
            color: colorScheme.onPrimary,
            fontSize: 14,
            height: 20 / 14,
            letterSpacing: 0.1 / 14, // 0.1px → ~0.007em
            fontWeight: FontWeight.w500,
          ),
        );
}
