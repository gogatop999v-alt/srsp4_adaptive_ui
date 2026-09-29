import 'package:flutter/material.dart';

const String kTranslationsPath = 'assets/translations';

const List<Locale> kSupportedLocales = [
  Locale('ru'),
  Locale('kk'),
  Locale('en'),
];

/// Названия языков показываются на родном языке и не переводятся.
const Map<String, String> kLanguageNames = {
  'ru': 'Русский',
  'kk': 'Қазақша',
  'en': 'English',
};
