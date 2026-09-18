import 'package:flutter/foundation.dart';

import '../data/product_repository.dart';
import '../domain/product.dart';

class CatalogController extends ChangeNotifier {
  CatalogController(this._repository);

  final ProductRepository _repository;

  bool isLoading = false;
  String query = '';
  String selectedCategory = 'All';
  List<Product> _products = const [];

  List<Product> get products {
    final normalizedQuery = query.trim().toLowerCase();

    return _products.where((product) {
      final categoryMatches =
          selectedCategory == 'All' || product.category == selectedCategory;
      final queryMatches = normalizedQuery.isEmpty ||
          product.name.toLowerCase().contains(normalizedQuery) ||
          product.description.toLowerCase().contains(normalizedQuery);

      return categoryMatches && queryMatches;
    }).toList(growable: false);
  }

  List<String> get categories => [
        'All',
        ...{for (final product in _products) product.category},
      ];

  Future<void> load() async {
    isLoading = true;
    notifyListeners();
    _products = await _repository.fetchProducts();
    isLoading = false;
    notifyListeners();
  }

  void setQuery(String value) {
    query = value;
    notifyListeners();
  }

  void setCategory(String value) {
    selectedCategory = value;
    notifyListeners();
  }
}
