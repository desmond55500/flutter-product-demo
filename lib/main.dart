import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'features/catalog/data/product_repository.dart';
import 'features/catalog/presentation/catalog_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CatalogController(DemoProductRepository())..load(),
      child: const PortfolioApp(),
    ),
  );
}
