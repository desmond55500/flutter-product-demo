import 'package:flutter/material.dart';

import 'core/theme.dart';
import 'features/catalog/presentation/catalog_screen.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nova Store',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const CatalogScreen(),
    );
  }
}
