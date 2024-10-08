import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items]; // retorno um clone dos items ao invés da lista inteira
  List<Product> get favoriteItems => _items.where((prod) => prod.isFavorite).toList();
  
  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); // sempre que houver uma mudança ele notifica de forma reativa
  }
}

  // bool _showFavoritesOnly = false;

  // List<Product> get items {
  //   if (_showFavoritesOnly) {
  //     // se for favorito ele retorna somente os favoritos
  //     return _items.where((prod) => prod.isFavorite).toList();
  //   }
  //   return [..._items]; // retorno um clone dos items ao invés da lista inteira
  // }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showall() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }