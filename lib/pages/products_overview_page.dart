import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/badge.dart';
import 'package:shop/components/product_grid.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/utils/app_routes.dart';

enum FilterOption { favorite, all }

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({super.key});

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Shop',
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOption.favorite,
                child: Text('Somente Favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOption.all,
                child: Text('Todos'),
              ),
            ],
            onSelected: (FilterOption selectedValue) {
              setState(() {
                if (selectedValue == FilterOption.favorite) {
                  _showFavoritesOnly = true;
                } else {
                  _showFavoritesOnly = false;
                }
              });
            },
          ),
          Consumer<Cart>(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.cart);
                },
                icon: const Icon(
                  Icons.shopping_cart,
                ),
              ),
              builder: (ctx, cart, child) => Badgee(
                    value: cart.itemsCount.toString(),
                    child: child!,
                  )),
        ],
      ),
      body: ProductGrid(_showFavoritesOnly),
      drawer: const AppDrawer(),
    );
  }
}
