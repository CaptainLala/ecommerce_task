import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './address_page.dart';

import '../Providers/cart_items.dart';

import '../Widgets/cart_cards.dart';
import '../Widgets/main_button.dart';
import '../Widgets/empty_cart.dart';

class CartPage extends StatelessWidget {
  static const routeName = '/cart';

  const CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItems>(context);
    final cartItems = cart.cartItems;
    double delivery = 5;
    if (cartItems.isEmpty) {
      delivery = 0.00;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              cart.cartItems.isEmpty
                  ? showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Oops..'),
                          content: const Text(
                            'Seems like your cart is already empty!',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: Text(
                                'Ok',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    )
                  : showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Clear Cart'),
                          content: const Text(
                            'Would you like to delete all the items in the cart?',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: Text(
                                'No',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            TextButton(
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              onPressed: () {
                                cart.removeAllItems();
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: cart.cartItems.isEmpty
          ? const EmptyCart()
          : ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(30),
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 30,
                    top: 30,
                  ),
                  width: 150,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Sub Total',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$${cart.totalAmount}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Delivery Fees',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '\$$delivery',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${cart.totalAmount + delivery}',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return CartCard(
                      cartItem: cartItems.values.toList()[index],
                      cartItemID: cartItems.keys.toList()[index],
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            '\$ ${cart.totalAmount + delivery}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 25,
                    bottom: 25,
                  ),
                  child: Center(
                    child: MainButton(
                      buttonName: 'Proceed',
                      path: AddressPage.routeName,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
