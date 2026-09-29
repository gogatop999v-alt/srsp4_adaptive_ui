import 'package:flutter_test/flutter_test.dart';

import 'package:srsp4_adaptive_ui/services/favorites_controller.dart';

void main() {
  test('Избранное: добавление и удаление товара', () {
    final favorites = FavoritesController();

    expect(favorites.isFavorite(1), isFalse);

    favorites.toggle(1);
    expect(favorites.isFavorite(1), isTrue);
    expect(favorites.items.length, 1);

    favorites.toggle(1);
    expect(favorites.isFavorite(1), isFalse);
    expect(favorites.items, isEmpty);
  });
}
