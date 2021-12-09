import 'package:flutter/material.dart';
import './category.dart';
import './store.dart';

class Stores with ChangeNotifier {
  final List<Store> _stores = [
    Store(
      image: 'assets/images/gamestop_logo.png',
      id: '1',
      name: 'GameStop',
      categories: [
        Category(id: '1', name: 'Xbox Games'),
        Category(id: '2', name: 'PS5 Games'),
        Category(id: '3', name: 'PC Games'),
        Category(id: '4', name: 'Wii U Games'),
      ],
      coverImages: [
        'assets/images/crysis.jpg',
        'assets/images/farcry.png',
        'assets/images/star_wars.jpg',
      ],
    ),
    Store(
      image: 'assets/images/zara_logo.png',
      id: '2',
      name: 'Zara',
      categories: [
        Category(id: '1', name: 'Jeans'),
        Category(id: '2', name: 'Shirts'),
        Category(id: '3', name: 'Shoes'),
        Category(id: '4', name: 'Jackets'),
      ],
      coverImages: [
        'assets/images/zara_1.jpg',
        'assets/images/zara_2.jpg',
      ],
    ),
  ];
  List<Store> get items {
    return [..._stores];
  }

  Store findById(String id) {
    return _stores.firstWhere((store) => store.id == id);
  }
}
