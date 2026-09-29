import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/localization/app_locales.dart';
import 'core/theme/app_theme.dart';
import 'pages/main_shell.dart';
import 'services/settings_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SettingsController.instance.load(); // сохранённая тема

  runApp(
    EasyLocalization(
      supportedLocales: kSupportedLocales,
      path: kTranslationsPath,
      fallbackLocale: const Locale('ru'),
      // Выбранный язык easy_localization сохраняет сам.
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // базовый размер макета
      minTextAdapt: true,
      splitScreenMode: true,
      child: const MainShell(),
      builder: (context, child) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: SettingsController.instance.themeMode,
          builder: (context, mode, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateTitle: (ctx) => 'app_title'.tr(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: mode,
            home: child,
          ),
        );
      },
    );
  }
}
