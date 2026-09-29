import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Настройки приложения. Тема и уведомления сохраняются между запусками.
/// (Язык сохраняет сам easy_localization.)
class SettingsController {
  SettingsController._();

  static final SettingsController instance = SettingsController._();

  static const _darkKey = 'dark_theme';
  static const _notificationsKey = 'notifications';

  final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);
  final ValueNotifier<bool> notifications = ValueNotifier(true);

  SharedPreferences? _prefs;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _prefs = prefs;
    themeMode.value =
        (prefs.getBool(_darkKey) ?? false) ? ThemeMode.dark : ThemeMode.light;
    notifications.value = prefs.getBool(_notificationsKey) ?? true;
  }

  Future<void> setDark(bool value) async {
    themeMode.value = value ? ThemeMode.dark : ThemeMode.light;
    await _prefs?.setBool(_darkKey, value);
  }

  Future<void> setNotifications(bool value) async {
    notifications.value = value;
    await _prefs?.setBool(_notificationsKey, value);
  }
}
