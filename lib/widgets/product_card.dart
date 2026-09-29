import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/localization/locale_extension.dart';
import '../models/product.dart';
import '../services/favorites_controller.dart';
import 'product_image.dart';

/// Добавляет / убирает товар из избранного и показывает SnackBar.
void toggleFavorite(BuildContext context, Product product) {
  final favorites = FavoritesController.instance;
  final wasFavorite = favorites.isFavorite(product.id);
  favorites.toggle(product.id);

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1200),
        content: Text(
          (wasFavorite ? 'removed_from_favorites' : 'added_to_favorites').tr(),
        ),
      ),
    );
}

/// Карточка товара для каталога: изображение, название, цена, кнопка «в избранное».
class ProductCard extends StatelessWidget {
  final Product product;
  final bool isFavorite;

  const ProductCard({
    super.key,
    required this.product,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    context.watchLocale();

    return Card(
      clipBehavior: Clip.antiAlias,
      color: AppColors.surfaceOf(context),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ProductImage(url: product.imageUrl)),
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 10.h, 4.w, 6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.nameKey.tr(),
                  style: AppTextStyles.body,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.formattedPrice,
                        style: AppTextStyles.price,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      iconSize: 24.sp,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? AppColors.favorite
                            : AppColors.textSecondaryOf(context),
                      ),
                      onPressed: () => toggleFavorite(context, product),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
