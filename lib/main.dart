import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/orders_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.purple,
            ).copyWith(
              secondary: Colors.deepOrange,
            ),
            fontFamily: 'Lato',
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.purple,
              titleTextStyle: TextStyle(
                fontFamily: 'Lato',
                color: Colors.white,
                fontSize: 25,
              ),
              iconTheme: IconThemeData(color: Colors.white),
              centerTitle: true,
            )),
        home:const ProductsOverviewPage(),
        routes: {
          AppRoutes.home: (ctx) => const ProductsOverviewPage(),
          AppRoutes.productDetail: (ctx) => const ProductDetailPage(),
          AppRoutes.cart: (ctx) => const CartPage(),
          AppRoutes.orders: (ctx) => const OrdersPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
