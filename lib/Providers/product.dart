import 'package:flutter/material.dart';

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
