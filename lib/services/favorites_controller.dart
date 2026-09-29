import 'package:flutter/foundation.dart';

import '../models/product.dart';

/// Общее состояние «Избранного» для Каталога и страницы «Избранное».
class FavoritesController extends ChangeNotifier {
  FavoritesController();

  static final FavoritesController instance = FavoritesController();

  final Set<int> _ids = {};

  bool isFavorite(int id) => _ids.contains(id);

  List<Product> get items =>
      kProducts.where((p) => _ids.contains(p.id)).toList();

  void toggle(int id) {
    if (!_ids.remove(id)) {
      _ids.add(id);
    }
    notifyListeners();
  }
}
