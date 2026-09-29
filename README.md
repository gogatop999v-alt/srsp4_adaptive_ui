# СРСП 4 - Адаптивный интерфейс Flutter

## Запуск
```bash
flutter create .
flutter pub get
flutter run
```

## Структура
```
lib/
├── main.dart                       запуск, ScreenUtilInit, EasyLocalization, темы
├── core/
│   ├── constants/app_colors.dart        цвета
│   ├── constants/app_text_styles.dart   текстовые стили (.sp)
│   ├── localization/                    языки, расширение для смены языка
│   └── theme/app_theme.dart             светлая и тёмная темы
├── models/product.dart
├── services/                        избранное, настройки (тема, уведомления)
├── pages/                           home / catalog / favorites / profile / main_shell
└── widgets/                         bottom_bar, product_card, product_image
assets/translations/ru.json, kk.json, en.json
```

## Дополнительные задания
- Тёмная тема и переключатель (Профиль)
- Язык (easy_localization) и тема (shared_preferences) сохраняются между запусками
- Анимация переключения страниц (AnimatedSwitcher: fade + slide)
- Переиспользуемый CustomBottomBar (список пунктов передаётся параметром)
- MediaQuery вместе с ScreenUtil: высота баннера на главной, число колонок в каталоге
