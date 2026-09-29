import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

extension WatchLocale on BuildContext {
  /// Подписывает виджет на смену языка (перестроение при context.setLocale).
  Locale watchLocale() => locale;
}
