import 'package:flutter/material.dart';

/// Все основные цвета приложения (светлая и тёмная темы).
class AppColors {
  AppColors._();

  // --- светлая тема ---
  static const primary = Color(0xFF2196F3);
  static const background = Color(0xFFF5F5F5);
  static const surface = Color(0xFFFFFFFF);
  static const textPrimary = Color(0xFF212121);
  static const textSecondary = Color(0xFF757575);
  static const white = Color(0xFFFFFFFF);
  static const favorite = Color(0xFFE53935);

  // --- тёмная тема ---
  static const darkBackground = Color(0xFF121212);
  static const darkSurface = Color(0xFF1E1E1E);
  static const darkTextPrimary = Color(0xFFEEEEEE);
  static const darkTextSecondary = Color(0xFFB0B0B0);

  static bool _isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  /// Цвет карточек и панелей для текущей темы.
  static Color surfaceOf(BuildContext context) =>
      _isDark(context) ? darkSurface : surface;

  /// Второстепенный текст для текущей темы.
  static Color textSecondaryOf(BuildContext context) =>
      _isDark(context) ? darkTextSecondary : textSecondary;
}
