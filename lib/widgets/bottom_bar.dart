import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/localization/locale_extension.dart';

class BottomBarItem {
  final IconData icon;
  final IconData activeIcon;
  final String labelKey;

  const BottomBarItem({
    required this.icon,
    required this.activeIcon,
    required this.labelKey,
  });
}

const List<BottomBarItem> kBottomBarItems = [
  BottomBarItem(icon: Icons.home_outlined, activeIcon: Icons.home, labelKey: 'home'),
  BottomBarItem(icon: Icons.shopping_bag_outlined, activeIcon: Icons.shopping_bag, labelKey: 'catalog'),
  BottomBarItem(icon: Icons.favorite_border, activeIcon: Icons.favorite, labelKey: 'favorites'),
  BottomBarItem(icon: Icons.person_outline, activeIcon: Icons.person, labelKey: 'profile'),
];

/// Переиспользуемая нижняя панель навигации.
/// Пункты можно передать снаружи, по умолчанию - 4 пункта приложения.
class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomBarItem> items;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.items = kBottomBarItems,
  });

  @override
  Widget build(BuildContext context) {
    context.watchLocale(); // перестраиваем подписи при смене языка

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.surfaceOf(context),
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondaryOf(context),
      selectedFontSize: 12.sp,
      unselectedFontSize: 12.sp,
      iconSize: 24.sp,
      items: [
        for (final item in items)
          BottomNavigationBarItem(
            icon: Icon(item.icon),
            activeIcon: Icon(item.activeIcon),
            label: item.labelKey.tr(),
          ),
      ],
    );
  }
}
