import 'package:flutter/material.dart';

class CartItems with ChangeNotifier {
  final Map<String, CartItem> _cartItems = {};
  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int quantity(String id) {
    return _cartItems[id] == null ? 0 : _cartItems[id]!.quantity;
  }

  void addCartItem(
    int id,
    String title,
    String image,
    double price,
  ) {
    if (_cartItems.containsKey(id.toString())) {
      _cartItems.update(
          id.toString(),
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                image: existingCartItem.image,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      _cartItems.putIfAbsent(
        id.toString(),
        () => CartItem(
          id: id,
          title: title,
          image: image,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    if (_cartItems.containsKey(id)) {
      if (_cartItems[id]!.quantity > 1) {
        _cartItems.update(
            id.toString(),
            (existingCartItem) => CartItem(
                  id: existingCartItem.id,
                  title: existingCartItem.title,
                  image: existingCartItem.image,
                  price: existingCartItem.price,
                  quantity: existingCartItem.quantity - 1,
                ));
      } else {
        _cartItems.remove(id);
      }
      notifyListeners();
    }
  }

  void removeAllItems() {
    _cartItems.clear();
    notifyListeners();
  }

  void removeItemById(String id) {
    _cartItems.remove(id);
    notifyListeners();
  }
}

class CartItem {
  final int id;
  final String title;
  final String image;
  final double price;
  final int quantity;
  CartItem({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
  });
}
