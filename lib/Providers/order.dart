import 'package:flutter/material.dart';
import './cart_item.dart';

class Order with ChangeNotifier {
  final String id;
  final String status;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  Order({
    required this.id,
    required this.status,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}
