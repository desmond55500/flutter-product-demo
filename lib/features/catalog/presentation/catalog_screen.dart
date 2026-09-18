import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'catalog_controller.dart';
import 'product_detail_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CatalogController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Store'),
        actions: [
          IconButton(
            tooltip: 'Refresh',
            onPressed: controller.isLoading ? null : controller.load,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: controller.isLoading
            ? const Center(child: CircularProgressIndicator())
            : LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth >= 900
                      ? 4
                      : constraints.maxWidth >= 600
                          ? 3
                          : 2;

                  return CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                        sliver: SliverToBoxAdapter(
                          child: TextField(
                            onChanged: controller.setQuery,
                            decoration: const InputDecoration(
                              hintText: 'Search products',
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 48,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.categories.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 8),
                            itemBuilder: (context, index) {
                              final category = controller.categories[index];
                              return ChoiceChip(
                                label: Text(category),
                                selected: controller.selectedCategory == category,
                                onSelected: (_) => controller.setCategory(category),
                              );
                            },
                          ),
                        ),
                      ),
                      if (controller.products.isEmpty)
                        const SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(child: Text('No products match your search.')),
                        )
                      else
                        SliverPadding(
                          padding: const EdgeInsets.all(16),
                          sliver: SliverGrid.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: columns,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.78,
                            ),
                            itemCount: controller.products.length,
                            itemBuilder: (context, index) {
                              final product = controller.products[index];

                              return Card(
                                child: InkWell(
                                  onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                      builder: (_) => ProductDetailScreen(product: product),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(14),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: Theme.of(context).colorScheme.primaryContainer,
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                            child: const Center(
                                              child: Icon(Icons.inventory_2_outlined, size: 46),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(product.category.toUpperCase(), style: Theme.of(context).textTheme.labelSmall),
                                        const SizedBox(height: 4),
                                        Text(product.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleMedium),
                                        const SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '\$' + product.price.toStringAsFixed(2),
                                                style: Theme.of(context).textTheme.titleSmall,
                                              ),
                                            ),
                                            const Icon(Icons.star, size: 16),
                                            const SizedBox(width: 2),
                                            Text(product.rating.toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
