import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

/// Текстовые стили приложения. Размеры адаптивные (.sp).
/// Сделаны геттерами, чтобы значения пересчитывались при смене размера экрана.
/// Цвет основного текста задаёт тема, поэтому здесь его нет.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle get title =>
      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold);

  static TextStyle get subtitle =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600);

  static TextStyle get body => TextStyle(fontSize: 16.sp);

  static TextStyle get caption => TextStyle(fontSize: 14.sp);

  static TextStyle get price => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      );
}
