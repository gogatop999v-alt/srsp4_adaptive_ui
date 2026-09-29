import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/localization/locale_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.watchLocale();

    // MediaQuery вместе с ScreenUtil: высота баннера зависит от высоты экрана,
    // но ограничена адаптивными значениями.
    final screenHeight = MediaQuery.sizeOf(context).height;
    final bannerHeight = (screenHeight * 0.22).clamp(150.h, 230.h).toDouble();

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('welcome_title'.tr(), style: AppTextStyles.title),
            SizedBox(height: 8.h),
            Text(
              'welcome_text'.tr(),
              style: AppTextStyles.body.copyWith(
                color: AppColors.textSecondaryOf(context),
              ),
            ),
            SizedBox(height: 20.h),
            _Banner(height: bannerHeight),
            SizedBox(height: 24.h),
            Text('advantages'.tr(), style: AppTextStyles.subtitle),
            SizedBox(height: 12.h),
            _InfoCard(
              icon: Icons.local_shipping_outlined,
              title: 'card_delivery_title'.tr(),
              text: 'card_delivery_text'.tr(),
            ),
            _InfoCard(
              icon: Icons.percent,
              title: 'card_discount_title'.tr(),
              text: 'card_discount_text'.tr(),
            ),
            _InfoCard(
              icon: Icons.support_agent,
              title: 'card_support_title'.tr(),
              text: 'card_support_text'.tr(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Banner extends StatelessWidget {
  final double height;

  const _Banner({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          colors: [AppColors.primary, Color(0xFF0D47A1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'banner_title'.tr(),
                  style: AppTextStyles.title.copyWith(color: AppColors.white),
                ),
                SizedBox(height: 8.h),
                Text(
                  'banner_text'.tr(),
                  style: AppTextStyles.body.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Icon(Icons.shopping_bag_outlined, size: 72.sp, color: AppColors.white),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surfaceOf(context),
      elevation: 2,
      margin: EdgeInsets.only(bottom: 12.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(30),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, size: 26.sp, color: AppColors.primary),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.subtitle),
                  SizedBox(height: 4.h),
                  Text(
                    text,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textSecondaryOf(context),
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
