import 'package:flutter/material.dart';
import './order.dart';
import './cart_item.dart';

class Orders with ChangeNotifier {
  final List<Order> _orders = [];
  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      Order(
        id: DateTime.now().toString(),
        status: 'Processing',
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  String getID() {
    return _orders[0].id;
  }

  Order findById(String id) {
    return _orders.firstWhere((order) => order.id == id);
  }
}
