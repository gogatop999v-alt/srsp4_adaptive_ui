import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/localization/locale_extension.dart';
import '../models/product.dart';
import '../services/favorites_controller.dart';
import '../widgets/product_card.dart';
import '../widgets/product_image.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.watchLocale();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Text('favorites'.tr(), style: AppTextStyles.title),
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: FavoritesController.instance,
              builder: (context, _) {
                final items = FavoritesController.instance.items;
                if (items.isEmpty) return const _EmptyState();

                return ListView.separated(
                  padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) =>
                      _FavoriteTile(product: items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.favorite_border, size: 72.sp, color: AppColors.primary),
            SizedBox(height: 16.h),
            Text('empty_favorites'.tr(), style: AppTextStyles.subtitle),
            SizedBox(height: 8.h),
            Text(
              'empty_favorites_hint'.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textSecondaryOf(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteTile extends StatelessWidget {
  final Product product;

  const _FavoriteTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: AppColors.surfaceOf(context),
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: SizedBox(
        height: 88.h,
        child: Row(
          children: [
            SizedBox(width: 88.w, height: 88.h, child: ProductImage(url: product.imageUrl)),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.nameKey.tr(),
                    style: AppTextStyles.body,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(product.formattedPrice, style: AppTextStyles.price),
                ],
              ),
            ),
            IconButton(
              iconSize: 24.sp,
              icon: const Icon(Icons.favorite, color: AppColors.favorite),
              onPressed: () => toggleFavorite(context, product),
            ),
          ],
        ),
      ),
    );
  }
}
