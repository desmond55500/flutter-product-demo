import '../domain/product.dart';

abstract interface class ProductRepository {
  Future<List<Product>> fetchProducts();
}

class DemoProductRepository implements ProductRepository {
  @override
  Future<List<Product>> fetchProducts() async {
    await Future<void>.delayed(const Duration(milliseconds: 450));

    return const [
      Product(id: 1, name: 'Aero Headphones', category: 'Audio', description: 'Lightweight wireless headphones with all-day battery life.', price: 79.99, rating: 4.7),
      Product(id: 2, name: 'Pulse Speaker', category: 'Audio', description: 'Portable speaker with rich sound and splash resistance.', price: 59.00, rating: 4.5),
      Product(id: 3, name: 'Arc Keyboard', category: 'Workspace', description: 'Compact mechanical keyboard designed for focused work.', price: 92.50, rating: 4.8),
      Product(id: 4, name: 'Halo Lamp', category: 'Workspace', description: 'Adjustable desk lamp with warm and cool light modes.', price: 39.99, rating: 4.4),
      Product(id: 5, name: 'Orbit Bottle', category: 'Lifestyle', description: 'Insulated stainless-steel bottle for everyday carry.', price: 24.99, rating: 4.6),
      Product(id: 6, name: 'Move Pack', category: 'Lifestyle', description: 'Minimal commuter backpack with a padded laptop sleeve.', price: 64.00, rating: 4.7),
    ];
  }
}
