import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/localization/app_locales.dart';
import '../core/localization/locale_extension.dart';
import '../services/settings_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String _appVersion = '1.0.0';

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watchLocale();
    final settings = SettingsController.instance;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('profile'.tr(), style: AppTextStyles.title),
            SizedBox(height: 24.h),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 48.r,
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.person, size: 56.sp, color: AppColors.white),
                  ),
                  SizedBox(height: 12.h),
                  Text('user_name'.tr(), style: AppTextStyles.subtitle),
                  SizedBox(height: 4.h),
                  Text(
                    'ivan@example.com',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textSecondaryOf(context),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Text('settings'.tr(), style: AppTextStyles.subtitle),
            SizedBox(height: 12.h),
            Card(
              color: AppColors.surfaceOf(context),
              elevation: 2,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  // --- переключатель языка ---
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.language, size: 24.sp, color: AppColors.primary),
                            SizedBox(width: 16.w),
                            Text('language'.tr(), style: AppTextStyles.body),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Wrap(
                          spacing: 8.w,
                          children: [
                            for (final entry in kLanguageNames.entries)
                              ChoiceChip(
                                label: Text(entry.value, style: AppTextStyles.caption),
                                selected: currentLocale.languageCode == entry.key,
                                onSelected: (_) =>
                                    context.setLocale(Locale(entry.key)),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  // --- тёмная тема ---
                  ValueListenableBuilder<ThemeMode>(
                    valueListenable: settings.themeMode,
                    builder: (context, mode, _) => SwitchListTile(
                      secondary: Icon(Icons.dark_mode_outlined, size: 24.sp, color: AppColors.primary),
                      title: Text('dark_theme'.tr(), style: AppTextStyles.body),
                      value: mode == ThemeMode.dark,
                      onChanged: settings.setDark,
                    ),
                  ),
                  const Divider(height: 1),
                  // --- уведомления ---
                  ValueListenableBuilder<bool>(
                    valueListenable: settings.notifications,
                    builder: (context, enabled, _) => SwitchListTile(
                      secondary: Icon(Icons.notifications_none, size: 24.sp, color: AppColors.primary),
                      title: Text('notifications'.tr(), style: AppTextStyles.body),
                      value: enabled,
                      onChanged: settings.setNotifications,
                    ),
                  ),
                  const Divider(height: 1),
                  // --- помощь ---
                  ListTile(
                    leading: Icon(Icons.help_outline, size: 24.sp, color: AppColors.primary),
                    title: Text('help'.tr(), style: AppTextStyles.body),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(content: Text('help_message'.tr())),
                        );
                    },
                  ),
                  const Divider(height: 1),
                  // --- о приложении ---
                  ListTile(
                    leading: Icon(Icons.info_outline, size: 24.sp, color: AppColors.primary),
                    title: Text('about_app'.tr(), style: AppTextStyles.body),
                    subtitle: Text(
                      '${'version'.tr()} $_appVersion',
                      style: AppTextStyles.caption,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => showAboutDialog(
                      context: context,
                      applicationName: 'app_title'.tr(),
                      applicationVersion: _appVersion,
                      children: [Text('about_text'.tr())],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
