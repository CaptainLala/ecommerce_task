import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './order_confirmation_page.dart';

import '../Providers/orders.dart';
import '../Providers/cart_items.dart';

import '../Widgets/home_address.dart';
import '../Widgets/different_address.dart';

class AddressPage extends StatefulWidget {
  static const routeName = '/address';
  const AddressPage({Key? key}) : super(key: key);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  bool val1 = true;
  bool val2 = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItems>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Delivery Address',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (val1) {
                      return;
                    } else {
                      val1 = !val1;
                      val2 = !val2;
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(30),
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  width: double.infinity,
                  height: 80,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Home Address',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: val1
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                      ),
                      Icon(
                        val1 ? Icons.radio_button_on : Icons.radio_button_off,
                        color: val1
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (val2) {
                      return;
                    } else {
                      val2 = !val2;
                      val1 = !val1;
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(30),
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 20,
                  ),
                  width: double.infinity,
                  height: 80,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Different Address',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: val2
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                      ),
                      Icon(
                        val2 ? Icons.radio_button_on : Icons.radio_button_off,
                        color: val2
                            ? Theme.of(context).primaryColor
                            : Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          val1 ? const HomeAddress() : const DifferentAddress(),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Place Order',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Provider.of<Orders>(
                      context,
                      listen: false,
                    ).addOrder(
                        cart.cartItems.values.toList(), cart.totalAmount);
                    cart.removeAllItems();
                    Navigator.pushReplacementNamed(
                        context, OrderConfirmation.routeName);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
