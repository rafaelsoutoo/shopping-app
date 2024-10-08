import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    // construtor
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    // metodo q vai me ajudar a fazer alternacia
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
