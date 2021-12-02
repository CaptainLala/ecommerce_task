import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [];

  void seedJeans() {
    for (int i = 0; i < 100; i++) {
      _items.add(Product(
        id: i + 1,
        title: 'Loose Fit Jean',
        image: 'assets/images/loose_jean.png',
        price: 20,
        storeId: '2',
        categoryId: '1',
      ));
    }
  }

  void seedShirts() {
    for (int i = 100; i < 200; i++) {
      _items.add(Product(
        id: i + 1,
        title: 'Overshirt',
        image: 'assets/images/overshirt.png',
        price: 30,
        storeId: '2',
        categoryId: '2',
      ));
    }
  }

  void seedJackets() {
    for (int i = 200; i < 300; i++) {
      _items.add(Product(
        id: i + 1,
        title: 'Leather Jacket',
        image: 'assets/images/leather_jacket.png',
        price: 40,
        storeId: '2',
        categoryId: '4',
      ));
    }
  }

  void seedShoes() {
    for (int i = 300; i < 400; i++) {
      _items.add(Product(
        id: i + 1,
        title: 'Red Sneakers',
        image: 'assets/images/red_sneakers.png',
        price: 25,
        storeId: '2',
        categoryId: '3',
      ));
    }
  }

  void seedXbox() {
    for (int i = 400; i < 500; i++) {
      _items.add(Product(
        id: i + 1,
        title: 'Gears of War 4',
        image: 'assets/images/xbox_game.png',
        price: 65,
        storeId: '1',
        categoryId: '1',
      ));
    }
  }

  void seedPs5() {
    for (int i = 500; i < 600; i++) {
      _items.add(Product(
        id: i + 1,
        title: 'Demon\'s Souls',
        image: 'assets/images/ps5_game.png',
        price: 40,
        storeId: '1',
        categoryId: '2',
      ));
    }
  }

  void seedPc() {
    for (int i = 500; i < 600; i++) {
      _items.add(Product(
        id: i + 1,
        title: 'Civilization VI',
        image: 'assets/images/pc_game.png',
        price: 55,
        storeId: '1',
        categoryId: '3',
      ));
    }
  }

  void seedWii() {
    for (int i = 500; i < 600; i++) {
      _items.add(Product(
        id: i + 1,
        title: 'Mario Kart',
        image: 'assets/images/wii_game.png',
        price: 30,
        storeId: '1',
        categoryId: '4',
      ));
    }
  }

  List<Product> getProducts(String catId, String storeId) {
    seedJackets();
    seedJeans();
    seedShirts();
    seedShoes();
    seedXbox();
    seedPs5();
    seedPc();
    seedWii();
    final products = _items
        .where((product) =>
            product.categoryId == catId && product.storeId == storeId)
        .toList();
    return products;
  }

  void addProduct() {
    notifyListeners();
  }
}

class Product with ChangeNotifier {
  final int id;
  final String title;
  final String image;
  final double price;
  final String storeId;
  final String categoryId;
  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.storeId,
    required this.categoryId,
  });
}
