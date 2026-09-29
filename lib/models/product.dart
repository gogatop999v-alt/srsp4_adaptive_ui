import 'package:easy_localization/easy_localization.dart';

class Product {
  final int id;
  final String nameKey; // ключ локализации
  final int price;
  final String imageUrl;

  const Product({
    required this.id,
    required this.nameKey,
    required this.price,
    required this.imageUrl,
  });

  /// Цена с разделителем разрядов и валютой из файла локализации.
  String get formattedPrice {
    final grouped = price
        .toString()
        .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => ' ');
    return 'price'.tr(args: [grouped]);
  }
}

const List<Product> kProducts = [
  Product(id: 1, nameKey: 'product_headphones', price: 12490, imageUrl: 'https://picsum.photos/seed/headphones/400/400'),
  Product(id: 2, nameKey: 'product_smartwatch', price: 15990, imageUrl: 'https://picsum.photos/seed/smartwatch/400/400'),
  Product(id: 3, nameKey: 'product_backpack', price: 8990, imageUrl: 'https://picsum.photos/seed/backpack/400/400'),
  Product(id: 4, nameKey: 'product_sneakers', price: 24990, imageUrl: 'https://picsum.photos/seed/sneakers/400/400'),
  Product(id: 5, nameKey: 'product_camera', price: 129990, imageUrl: 'https://picsum.photos/seed/camera/400/400'),
  Product(id: 6, nameKey: 'product_speaker', price: 18500, imageUrl: 'https://picsum.photos/seed/speaker/400/400'),
  Product(id: 7, nameKey: 'product_keyboard', price: 9900, imageUrl: 'https://picsum.photos/seed/keyboard/400/400'),
  Product(id: 8, nameKey: 'product_lamp', price: 5490, imageUrl: 'https://picsum.photos/seed/lamp/400/400'),
];
