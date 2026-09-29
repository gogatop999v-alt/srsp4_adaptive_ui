import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';

/// Картинка из сети с индикатором загрузки и заглушкой при ошибке.
class ProductImage extends StatelessWidget {
  final String url;

  const ProductImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) => Container(
        color: AppColors.primary.withAlpha(30),
        alignment: Alignment.center,
        child: Icon(Icons.image_outlined, size: 40.sp, color: AppColors.primary),
      ),
    );
  }
}
