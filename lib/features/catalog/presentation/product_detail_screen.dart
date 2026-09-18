import 'package:flutter/material.dart';

import '../domain/product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          AspectRatio(
            aspectRatio: 16 / 10,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Center(
                child: Icon(Icons.inventory_2_outlined, size: 80),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(product.category, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          Text(product.name, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          Text(product.description),
          const SizedBox(height: 24),
          Row(
            children: [
              Text(
                '\$' + product.price.toStringAsFixed(2),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const Spacer(),
              const Icon(Icons.star),
              const SizedBox(width: 4),
              Text(product.rating.toString()),
            ],
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added to demo cart')),
              );
            },
            icon: const Icon(Icons.shopping_bag_outlined),
            label: const Text('Add to cart'),
          ),
        ],
      ),
    );
  }
}
