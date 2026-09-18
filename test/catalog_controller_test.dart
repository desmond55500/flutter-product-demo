import 'package:flutter_product_demo/features/catalog/data/product_repository.dart';
import 'package:flutter_product_demo/features/catalog/presentation/catalog_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('filters loaded products by category and query', () async {
    final controller = CatalogController(DemoProductRepository());

    await controller.load();
    expect(controller.products.length, 6);

    controller.setCategory('Audio');
    expect(controller.products.length, 2);

    controller.setQuery('Aero');
    expect(controller.products.length, 1);
    expect(controller.products.single.name, 'Aero Headphones');
  });
}
