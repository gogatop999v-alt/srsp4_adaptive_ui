import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_text_styles.dart';
import '../core/localization/locale_extension.dart';
import '../models/product.dart';
import '../services/favorites_controller.dart';
import '../widgets/product_card.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.watchLocale();

    // Количество колонок зависит от ширины экрана (телефон / планшет).
    final width = MediaQuery.sizeOf(context).width;
    final columns = width >= 900 ? 4 : (width >= 600 ? 3 : 2);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Text('catalog_title'.tr(), style: AppTextStyles.title),
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: FavoritesController.instance,
              builder: (context, _) {
                return GridView.builder(
                  padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
                  itemCount: kProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    mainAxisSpacing: 12.h,
                    crossAxisSpacing: 12.w,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final product = kProducts[index];
                    return ProductCard(
                      product: product,
                      isFavorite:
                          FavoritesController.instance.isFavorite(product.id),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
