import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/product_item.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavoritesOnly;
  const ProductGrid(this.showFavoritesOnly, {super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loadedProducts =
        showFavoritesOnly ? provider.favoriteItems : provider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // quero q exiba dois produtos por linha
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10, // espço entre os produtos
        mainAxisSpacing: 10, // espaço entre as linhas
      ),
    );
  }
}
