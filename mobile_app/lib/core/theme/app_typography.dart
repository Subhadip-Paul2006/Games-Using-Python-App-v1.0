import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._();

  static const String fontLatin = 'Outfit';
  static const String fontMono = 'JetBrainsMono';

  static TextTheme buildTextTheme(ColorScheme scheme) {
    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: fontLatin,
        fontSize: 57,
        height: 64 / 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        color: scheme.onSurface,
      ),
      displayMedium: TextStyle(
        fontFamily: fontLatin,
        fontSize: 45,
        height: 52 / 45,
        fontWeight: FontWeight.w400,
        color: scheme.onSurface,
      ),
      displaySmall: TextStyle(
        fontFamily: fontLatin,
        fontSize: 36,
        height: 44 / 36,
        fontWeight: FontWeight.w400,
        color: scheme.onSurface,
      ),
      headlineLarge: TextStyle(
        fontFamily: fontLatin,
        fontSize: 32,
        height: 40 / 32,
        fontWeight: FontWeight.w600,
        color: scheme.onSurface,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontLatin,
        fontSize: 28,
        height: 36 / 28,
        fontWeight: FontWeight.w600,
        color: scheme.onSurface,
      ),
      headlineSmall: TextStyle(
        fontFamily: fontLatin,
        fontSize: 24,
        height: 32 / 24,
        fontWeight: FontWeight.w600,
        color: scheme.onSurface,
      ),
      titleLarge: TextStyle(
        fontFamily: fontLatin,
        fontSize: 22,
        height: 28 / 22,
        fontWeight: FontWeight.w600,
        color: scheme.onSurface,
      ),
      titleMedium: TextStyle(
        fontFamily: fontLatin,
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: scheme.onSurface,
      ),
      titleSmall: TextStyle(
        fontFamily: fontLatin,
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: scheme.onSurface,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontLatin,
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: scheme.onSurface,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontLatin,
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: scheme.onSurface,
      ),
      bodySmall: TextStyle(
        fontFamily: fontLatin,
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: scheme.onSurface,
      ),
      labelLarge: TextStyle(
        fontFamily: fontLatin,
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        color: scheme.onSurface,
      ),
      labelMedium: TextStyle(
        fontFamily: fontLatin,
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        color: scheme.onSurface,
      ),
      labelSmall: TextStyle(
        fontFamily: fontLatin,
        fontSize: 11,
        height: 16 / 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        color: scheme.onSurface,
      ),
    );
  }

  static const TextStyle scoreStyle = TextStyle(
    fontFamily: fontMono,
    fontSize: 16,
    height: 24 / 16,
    fontFeatures: [FontFeature.tabularFigures()],
  );
}
